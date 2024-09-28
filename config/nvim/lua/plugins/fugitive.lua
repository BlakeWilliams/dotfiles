return {
  {
    'tpope/vim-fugitive',
    cmd = { "Git" }, 
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Git diff<cr>", desc = "Git diff" },
      { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    }
  }
}
