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

" Workflow
Plug 'BlakeWilliams/vim-pry'
Plug 'BlakeWilliams/vim-tbro'
Plug 'RRethy/vim-illuminate'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'sjl/gundo.vim'

" Languages and markup
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'

" Colors
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'cocopon/iceberg.vim'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" writing
Plug 'junegunn/goyo.vim'

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim
source $HOME/.config/nvim/autocommands.vim
