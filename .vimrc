set nocompatible  "Remove vi compatibility
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'

" tpope utilities
" Plugin 'tpope/vim-surround' " Remove until issues are resolved
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-rsi.git'

" Workflow
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bogado/file-line'
Plugin 'justinmk/vim-sneak'
Plugin 'ervandew/supertab'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'BlakeWilliams/vim-tbro'
Plugin 'thoughtbot/vim-rspec'

" Languages and markup
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'zaiste/VimClojure'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'

" Colors
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'BlakeWilliams/vim-single-cursor-line'

call vundle#end()
filetype plugin indent on

" Split config up for cleanliness
source $HOME/.vim/config.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim

source $HOME/.vim/autocommands.vim
