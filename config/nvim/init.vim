filetype off

" setup Plug
call plug#begin('~/.config/nvim/bundle')

" tpope utilities
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'

" Workflow
Plug 'BlakeWilliams/vim-pry'
Plug 'BlakeWilliams/vim-tbro'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'sjl/gundo.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'

" Searching
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'RRethy/vim-illuminate'
Plug 'mhinz/vim-grepper'

" Languages and markup
Plug 'sheerun/vim-polyglot'

" Colors / Theme
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'catppuccin/vim'
Plug 'folke/tokyonight.nvim'
Plug 'rose-pine/neovim'

" writing
Plug 'junegunn/goyo.vim'

" neovim specific plugins
if has('nvim-0.5')
  "ugh
  Plug 'nvim-lua/plenary.nvim'
  " Syntax highlighting and formatting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'sbdchd/neoformat'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  " Plug 'mfussenegger/nvim-lint'
  " Plug 'dense-analysis/ale'
  Plug 'williamboman/mason.nvim'

  " Completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

  " Snippets
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'golang/vscode-go'

  " Copilot
  Plug 'github/copilot.vim'
  Plug 'zbirenbaum/copilot-cmp'
  Plug 'zbirenbaum/copilot.lua'
endif

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim
source $HOME/.config/nvim/autocommands.vim

lua require('lsp')
lua require('signs')
lua require('status')
lua require('treesitter')
lua require('whichkey')
lua require('welcome')
