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
Plug 'bswinnerton/vim-test-github'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'sjl/gundo.vim'
Plug 'tmsvg/pear-tree'

" Languages and markup
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'

" Colors
" Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

" autocompletion
" Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim
source $HOME/.config/nvim/autocommands.vim
