filetype off

" setup Plug
call plug#begin('~/.config/nvim/bundle')

" tpope utilities
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'

" Workflow
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'BlakeWilliams/vim-tbro'
Plug 'BlakeWilliams/vim-pry'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'

" Languages and markup
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-lang/vim-elixir'
Plug 'wting/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml',                  { 'for': 'toml' }
Plug 'hail2u/vim-css3-syntax'

" Colors
Plug 'vim-airline/vim-airline'
Plug 'BlakeWilliams/vim-single-cursor-line'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim
source $HOME/.config/nvim/autocommands.vim
