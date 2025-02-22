return {
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    init = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static", -- necessary until they fix flickering in tmux/zellij
      -- render = "compact"
    },

    init = function()
      vim.notify = require("notify")
    end,
  },
}
