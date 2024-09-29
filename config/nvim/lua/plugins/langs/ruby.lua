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
        -- solargraph = {
        --   enabled = "solargraph",
        -- },
        rubocop = {
          mason = false,
          on_init = function(client)
            local util = require('lspconfig/util')

            local function rubocop_config_exists()
              local configs = { '.rubocop.yml', '.rubocop.yaml' }
              for _, config in ipairs(configs) do
                if util.path.exists(vim.loop.cwd() .. '/' .. config) then
                  return true
                end
              end
              return false
            end

            if not rubocop_config_exists() then
              client.stop()
              return
            end
          end
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
  },
  {
    "stevearc/conform.nvim",
    init = function()
      local function has_standard_gem()
        local gemfile_lock = vim.fn.getcwd() .. "/Gemfile.lock"
        local file = io.open(gemfile_lock, "r")
        if not file then return false end

        for line in file:lines() do
          if line:match('standard') then
            file:close()
            return true
          end
        end

        file:close()
        return false
      end

      if has_standard_gem() then
        require("conform").setup({
          formatters_by_ft = {
            ruby = { "standardrb" },
          },
        })
      end
    end
  },
}
