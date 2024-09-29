return {
  {
    -- "folke/noice.nvim",
    -- event = "VeryLazy",
    -- opts = {
    --   cmdline = { enabled = false },
    --   messages = { enabled = false },
    --   lsp = {
    --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --     override = {
    --       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --       ["vim.lsp.util.stylize_markdown"] = true,
    --       ["cmp.entry.get_documentation"] = true,
    --     },
    --   },
    --   -- you can enable a preset for easier configuration
    --   presets = {
    --     bottom_search = true,         -- use a classic bottom cmdline for search
    --     command_palette = true,       -- position the cmdline and popupmenu together
    --     long_message_to_split = true, -- long messages will be sent to a split
    --     lsp_doc_border = true,        -- add a border to hover docs and signature help
    --   },
    -- },
    -- dependencies = {
    --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --   "MunifTanjim/nui.nvim",
    --   {
    --     "rcarriga/nvim-notify",
    --     opts = {
    --       stages = "static", -- necessary until they fix flickering in tmux/zellij
    --       renderer = "compact"
    --     },
    --   }
    -- }
  },
  {

    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    init = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    {
      "rcarriga/nvim-notify",
      opts = {
        stages = "static", -- necessary until they fix flickering in tmux/zellij
        renderer = "compact"
      },

      init = function()
        vim.notify = require("notify")
      end,
    }
  }
}
