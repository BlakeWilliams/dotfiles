return {
  { 'tpope/vim-eunuch',          event = "VeryLazy" },
  { 'tpope/vim-rails',           event = "VeryLazy" },
  { 'tpope/vim-vinegar',         lazy = false },
  { 'tpope/vim-projectionist',   event = "VeryLazy" },

  -- Searching
  { 'RRethy/vim-illuminate',     event = "VeryLazy" },
  { 'mhinz/vim-grepper',         event = "VeryLazy" },

  -- Languages and markup
  { 'sheerun/vim-polyglot',      event = "VeryLazy" },

  -- Colors / Theme
  { 'gruvbox-community/gruvbox' },
  { 'sainnhe/gruvbox-material' },
  { 'sainnhe/sonokai' },
  { 'sainnhe/everforest' },
  { 'catppuccin/vim' },
  { 'folke/tokyonight.nvim' },
  { 'rose-pine/neovim' },
  { 'maxmx03/solarized.nvim' },
  {
    'junegunn/goyo.vim',
    init = function()
      vim.g.goyo_auto_leave = 0

      vim.api.nvim_create_autocmd("User", {
        pattern = "GoyoEnter",
        callback = function()
          vim.o.laststatus = 0
          vim.o.showtabline = 0
          vim.o.signcolumn = 'no'
          vim.opt_local.linebreak = true
          require("lualine").hide()
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "GoyoLeave",
        callback = function()
          vim.o.laststatus = 2
          vim.o.showtabline = 2
          vim.o.signcolumn = 'yes:1'
          vim.opt_local.linebreak = false
          require("lualine").hide({ unhide = true })
        end,
      })
    end
  },
}
