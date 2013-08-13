set nocompatible  "Remove vi compatibility

" Setup Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gamirik/vundle'

" tpope utilities
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-dispatch'

" Workflow
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'gregsexton/gitv'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'jpalardy/vim-slime'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'thoughtbot/vim-rspec'

" Languages and markup
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'zaiste/VimClojure'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'

" Colors
Bundle 'altercation/vim-colors-solarized'

" Split config up for cleanliness
source $HOME/.vim/colors.vim
source $HOME/.vim/config.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim
" source $HOME/.vim/statusline.vim
source $HOME/.vim/tabs.vim

source $HOME/.vim/autocommands.vim
