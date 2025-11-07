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
      icons = {
        error = " ",
        warn = " ",
        info = " ",
      },
    },
    quickfile = { enabled = true }
  },
}
