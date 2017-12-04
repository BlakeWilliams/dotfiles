filetype off

" setup Plug
call plug#begin('~/.vim/bundle')

" tpope utilities
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rails'

" Workflow
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'BlakeWilliams/vim-tbro'
Plug 'BlakeWilliams/vim-pry'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

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
Plug 'leafgarland/typescript-vim'
Plug 'flowtype/vim-flow'
Plug 'reasonml-editor/vim-reason'
Plug 'rhysd/vim-crystal'

" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'BlakeWilliams/vim-single-cursor-line'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

" Split config up for cleanliness
source $HOME/.vim/config.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/autocommands.vim
