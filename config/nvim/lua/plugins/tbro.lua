return {
  {
    "blakewilliams/vim-tbro",
    lazy = false, -- todo fix <leader>t calls to unlazy this
    cmd = { "Tbro", "TbroPane", "TbroRaw", "TbroRedo" },
    keys = {
      { "!", "<cmd>Tbro<cr>", desc = "Run command in tmux", mode = "n" },
      { "!!", "<cmd>TbroRedo<cr>", desc = "Rerun last tmux command", mode = "n" },

      { "<leader>t", ":call tbro#run_selection()<CR>", mode = "v", silent = true, desc = "Run selection" },
      { "<leader>t", ":call tbro#run_line()<CR>", mode = "n", silent = true, desc = "Run line" },
    },
  }
}
