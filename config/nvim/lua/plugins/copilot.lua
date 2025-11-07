return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = { "Copilot" },
    build = ":Copilot auth",
    keys = {
      { "<leader>ct", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
    },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = { markdown = true, gitcommit = true, help = true },
      float = { border = GlobalConfig.border },
    },
  },

  -- Load copilot-cmp on InsertEnter too, not as nvim-cmp’s dependency
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
    opts = { fix_pairs = true },
    config = function(_, opts)
      require("copilot_cmp").setup(opts)
      -- Remove any manual _on_insert_enter calls
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    -- keep your other cmp settings as-is
    opts = function(_, opts)
      table.insert(opts.sources, 1, { name = "copilot", group_index = 1, priority = 100 })
    end,
  },
}
