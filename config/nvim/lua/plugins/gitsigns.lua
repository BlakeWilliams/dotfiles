return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',

    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '|' },
        topdelete    = { text = '|' },
        changedelete = { text = '|' },
      },
      numhl = true,
    },
  }
}
