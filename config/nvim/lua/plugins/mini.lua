return {
  {
    'echasnovski/mini.comment',
    version = '*',
    opts = {}
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    lazy = false,
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    version = '*',
    lazy = false,
    init = function()
      local opts = require("mini.surround").setup()
    end,
    opts = {
      mappings = {
        add = "gsa",            -- Add surrounding in Normal and Visual modes
        delete = "gsd",         -- Delete surrounding
        find = "gsf",           -- Find surrounding (to the right)
        find_left = "gsF",      -- Find surrounding (to the left)
        highlight = "gsh",      -- Highlight surrounding
        replace = "gsr",        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    'echasnovski/mini.ai',
    version = '*',
  },
}
