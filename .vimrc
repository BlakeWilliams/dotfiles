set nocompatible  "Remove vi compatibility

" Setup Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle.vim'

" tpope utilities
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'

" Workflow
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'bogado/file-line'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
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

" Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Colors
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'BlakeWilliams/vim-single-cursor-line'

" Split config up for cleanliness
source $HOME/.vim/config.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/statusline.vim
source $HOME/.vim/tabs.vim

source $HOME/.vim/autocommands.vim
