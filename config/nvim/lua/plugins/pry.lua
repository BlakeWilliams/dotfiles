return {
  {
    name = "pry",
    'BlakeWilliams/vim-pry',
    keys = {
      {
        "<leader>d",
        ":call pry#insert()<CR>",
        desc = "Insert debug statement"
      },
    },
  }
}
