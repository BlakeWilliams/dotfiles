return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby" } },
    init = function()
      vim.g.ruby_indent_assignment_style = 'variable'
      vim.g.rails_projections = {
        ["test/integration/*_test.rb"] = {
          type = "integration test",
          alternate = "app/controllers/{}.rb"
        },
        ["app/controllers/*_controller.rb"] = {
          affinity = "controller",
          template = {
            "class {camelcase|capitalize|colons}Controller < ApplicationController",
            "end"
          },
          type = "controller",
          alternate = "test/integration/{}_controller_test.rb"
        }
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
          enabled = lsp == "solargraph",
        },
        rubocop = {
          enabled = formatter == "rubocop",
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       -- ruby = { formatter },
  --       -- eruby = { "erb-format" },
  --     },
  --   },
  -- },
}
