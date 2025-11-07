return {
  "folke/snacks.nvim",
  version = "*",
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = true },
    animate = {
      duration = { step = 10, total = 150 },

      easing = "linear",
    },
    words = { enabled = true },
    input = {
      enabled = true,
      icon = "",
      relative = "cursor",
      prompt_pos = "left",
      win = {
        relative = "cursor",
        row = -3,
      },
      expand = true,
    },
    notifier = {
      enabled = true,
      style = "compact",
      icons = {
        error = "",
        warn = "",
        info = "",
      },
      win = {
        wo = {             -- window-local options
          wrap = true,
          linebreak = true,
          breakindent = true,
        },
      },
    },
    quickfile = { enabled = true },
    styles = {
      notification = {
        wo = {
          wrap = true,
        },
      },
    },
  },
}
