return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "typescript", "javascript" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
        },
        vtsls = {
          enabled = false,
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function()
          return true
        end,
        vtsls = function(_, opts)
          opts.settings.javascript = vim.tbl_deep_extend("force", {}, opts.settings.typescript,
            opts.settings.javascript or {})
        end,
      },
    },
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function()
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     table.insert(opts.ensure_installed, "tsserver")
  --   end,
  -- },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "gomodifytags", "impl" } },
      },
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofmt,
      })
    end,
  },
}
