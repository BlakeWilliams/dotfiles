return {
  {
    'echasnovski/mini.animate',
    version = '*',
    lazy = false,
    opts = function()
      local animate = require('mini.animate')

      return {
        cursor = {
          enable = false,
          timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }),
        },
        resize = {
          enable = false,
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 125, unit = 'total' }),
        },
      }
    end
  },
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
}
