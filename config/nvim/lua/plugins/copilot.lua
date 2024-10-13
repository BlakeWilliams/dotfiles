return {
  {
    'zbirenbaum/copilot.lua',
    event = "InsertEnter",
    cmd = { "Copilot" },
    build = ":Copilot auth",
    keys = {
      { "<leader>ct", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
    },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        gitcommit = true,
        help = true,
      },
      float = { border = GlobalConfig.border },
    }
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        dependencies = "copilot.lua",
        opts = {
          fix_pairs = true
        },
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          lsp_on_attach(function(client)
            copilot_cmp._on_insert_enter({})
          end, "copilot")
        end,
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
    end,
  },
}
