filetype off

" setup Plug
call plug#begin('~/.vim/bundle')

" tpope utilities
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'

" Workflow
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'bogado/file-line'
Plug 'ervandew/supertab'
Plug 'BlakeWilliams/vim-tbro'
Plug 'junegunn/vim-easy-align'
Plug 'BlakeWilliams/vim-pry'
Plug 'benekastah/neomake'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'

" Languages and markup
Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-haml',                    { 'for': 'haml' }
Plug 'elixir-lang/vim-elixir'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml',                  { 'for': 'toml' }
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'cohama/lexima.vim'

" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'BlakeWilliams/vim-single-cursor-line'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/shortcuts.vim

source $HOME/.config/nvim/notes.vim
source $HOME/.config/nvim/autocommands.vim
