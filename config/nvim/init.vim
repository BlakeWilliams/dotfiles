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

" Searching
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'RRethy/vim-illuminate'
Plug 'mhinz/vim-grepper'

" Languages and markup
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot'

" Colors / Theme
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'

let g:dotfiles_use_lsp_client = 0

" autocompletion
if g:dotfiles_use_lsp_client == 0
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" writing
Plug 'junegunn/goyo.vim'

" neovim specific plugins
if has('nvim-0.5')
  if g:dotfiles_use_lsp_client == 1
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
  endif

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/coc.vim

if has('nvim-0.5')
  source $HOME/.config/nvim/experimental.vim
endif
