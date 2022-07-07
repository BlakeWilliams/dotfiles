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
Plug 'dense-analysis/ale'
Plug 'sjl/gundo.vim'
Plug 'lewis6991/gitsigns.nvim'

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

" writing
Plug 'junegunn/goyo.vim'

" neovim specific plugins
if has('nvim-0.5')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'neovim/nvim-lspconfig'
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
