require('mason').setup()
-- Setup copilot
require("copilot").setup()

require("copilot_cmp").setup {
  method = "getCompletionsCycling",
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 0,
      prefix = "»",

    },
    signs = true,
  }
)

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
    sources = cmp.config.sources(
      {
        { name = "copilot" },
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lsp_signature_help' },
      },
      {
        { name = 'buffer' },
      }
    )
  })

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        {
          name = 'path',
          option = { trailing_slash = true },
        }
      }, {
        { name = 'cmdline' }
      })
  })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local signs = { Error = "✕", Warn = "! ", Hint = "★ ", Info = "i " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local format = function()
    vim.lsp.buf.format {
      async = false,
      filter = function(client)
        return client.name ~= "tsserver" and client.name ~= "solargraph"
      end
    }
  end

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>cf', format, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "show references" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      buffer = bufnr,
      callback = function()
        format()
      end,
    })
  end

  vim.cmd [[autocmd CursorHold <buffer> lua vim.diagnostic.open_float({focus=false, border = "rounded"})]]
  vim.cmd [[autocmd CursorHoldI <buffer> lua vim.diagnostic.open_float({focus=false, border = "rounded" })]]
end

-- Go autoimport
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
      local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
      params.context = {only = {"source.organizeImports"}}

      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end,
  })

require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
-- require'lspconfig'.golangci_lint_ls.setup{ on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
require'lspconfig'.solargraph.setup{ on_attach = on_attach, capabilities = capabilities }

-- require("null-ls").setup({
--   sources = {
--     require("null-ls").builtins.formatting.stylua,
--     require("null-ls").builtins.diagnostics.golangci_lint,
--     require("null-ls").builtins.diagnostics.eslint,
--     require("null-ls").builtins.diagnostics.shellcheck,
--     require("null-ls").builtins.diagnostics.erb_lint,
--     require("null-ls").builtins.diagnostics.rubocop,
--     -- require("null-ls").builtins.formatting.vale,
--     require("null-ls").builtins.formatting.prettier,
--   },
-- })

local null_ls = require("null-ls")

null_ls.setup({
    -- debug = true,
    on_attach = on_attach,
    capabilities = capabilities,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.vale,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.golangci_lint,
    },
})
