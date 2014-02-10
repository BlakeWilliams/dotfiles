set nocompatible  "Remove vi compatibility

" Setup Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmairik/vundle'

" tpope utilities
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'

" Workflow
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'thoughtbot/vim-rspec'

" Languages and markup
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'zaiste/VimClojure'
Bundle 'mustache/vim-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'

" Colors
Bundle 'chriskempson/base16-vim'
Bundle 'bling/vim-airline'
Bundle 'BlakeWilliams/vim-single-cursor-line'

" Split config up for cleanliness
source $HOME/.vim/colors.vim
source $HOME/.vim/config.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/statusline.vim
source $HOME/.vim/tabs.vim

source $HOME/.vim/autocommands.vim
