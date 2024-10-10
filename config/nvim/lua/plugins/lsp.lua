function lsp_get_clients(opts)
  local clients = vim.lsp.get_clients(opts)
  return opts and opts.filter and vim.tbl_filter(opts.filter, clients) or clients
end

function lsp_on_attach(on_attach, name)
  return vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (not name or client.name == name) then
        return on_attach(client, buffer)
      end
    end,
  })
end

local function key_supports(buffer, method)
  method = method:find("/") and method or "textDocument/" .. method
  local clients = lsp_get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    if client.supports_method(method) then
      return true
    end
  end
  return false
end

local function lspkeymap()
  return {
    { "gD",         vim.lsp.buf.declaration,                    desc = "Go to Declaration" },
    { "gd",         vim.lsp.buf.definition,                     desc = "Go to Definition",           has = "definition" },
    { "K",          vim.lsp.buf.hover,                          desc = "Hover" },
    { "gi",         vim.lsp.buf.implementation,                 desc = "Go to Implementation" },
    { "<C-k>",      vim.lsp.buf.signature_help,                 mode = "i",                          desc = "Signature Help", has = "signatureHelp" },
    { "gr",         vim.lsp.buf.references,                     desc = "References",                 nowait = true },
    { "gy",         vim.lsp.buf.type_definition,                desc = "Go to T[y]pe Definition" },
    { "gK",         vim.lsp.buf.signature_help,                 desc = "Signature Help",             has = "signatureHelp" },
    { "<leader>ca", vim.lsp.buf.code_action,                    desc = "Code Action",                mode = { "n", "v" },     has = "codeAction" },
    { "<leader>cc", vim.lsp.codelens.run,                       desc = "Run Codelens",               mode = { "n", "v" },     has = "codeLens" },
    { "<leader>cC", vim.lsp.codelens.refresh,                   desc = "Refresh & Display Codelens", mode = { "n" },          has = "codeLens" },
    { "<leader>cr", vim.lsp.buf.rename,                         desc = "Rename",                     has = "rename" },
    { "<leader>cl", "<cmd>LspInfo<cr>",                         desc = "Lsp Info" },
    { "<leader>e",  "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show diagnostic" },
  }
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      local ret = {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = GlobalConfig.icons.Error,
              [vim.diagnostic.severity.WARN] = GlobalConfig.icons.Warn,
              [vim.diagnostic.severity.HINT] = GlobalConfig.icons.Hint,
              [vim.diagnostic.severity.INFO] = GlobalConfig.icons.Info
            },
          },
        },
        inlay_hints = { enabled = false },
        codelens = { enabled = true, },
        document_highlight = { enabled = true, },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        format = { formatting_options = nil, timeout_ms = nil, },
        setup = {},
      }
      return ret
    end,
    config = function(_, opts)
      lsp_on_attach(function(client, buffer)
        local Keys = require("lazy.core.handler.keys")
        local mapping = Keys.resolve(lspkeymap())

        for _, keys in pairs(mapping) do
          local has = not keys.has or key_supports(buffer, keys.has)
          local cond = not (keys.cond == false or ((type(keys.cond) == "function") and not keys.cond()))

          if has and cond then
            local opts = Keys.opts(keys)
            opts.cond = nil
            opts.has = nil
            opts.silent = opts.silent ~= false
            opts.buffer = buffer
            vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
          end
        end
      end)

      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers or {}
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end
      --
      if have_mason then
        mlsp.setup({
          ensure_installed = vim.tbl_deep_extend(
            "force",
            ensure_installed,
            {}
          ),
          handlers = { setup },
        })
      end
    end,
  },

  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
