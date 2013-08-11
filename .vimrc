set nocompatible  "Remove vi compatibility
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle must manage Vundle
Bundle 'gamirik/vundle'

" tpope utilities
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'

" workflow
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'gregsexton/gitv'
Bundle 'terryma/vim-multiple-cursors'

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
Bundle 'BlakeWilliams/vim-tomorrow'
Bundle 'BlakeWilliams/statuslight'

syntax on
set nohidden                    " Enable/Disabe unsaved buffers 
set backupcopy=yes              " Keeps original creator code
set hlsearch                    " Highlights search
set noerrorbells                " Obvious
set backspace=indent,eol,start  " Adds intuitive backspacing
"set fdc=1                       " Fold column width
set nobackup                    " No Backup files
set noswapfile                  " No swap
"set backupdir=~/.vim/backup     " Custom location for backups
"set directory=~/.vim/tmp       " Location for the swap file
set showmatch                   " Show matching paren/brace/bracket
set ignorecase                  " Ignore case in searches
set smarttab                    " Prevents tab/space issues
"set paste                       " Paste like gui with indents *has to go before autoindent and smartindent*
set autoindent                  " Copy indent from previous line
set smartindent                 " Auto insert extra indent level in certain cases
set undolevels=500              " More undo
set history=100		              " keep 100 lines of command line history
set showcmd                     " Show command in the last line of the screen
set incsearch                   " Searches for text as entered
set laststatus=2                " Always show status line for powerline
set nowrap                      " Don't wrap lines
set gdefault                    " When on a line, replace all matches in line
set splitbelow                  " Open hsplits below rather than above
set splitright                  " Open vsplits to the right rather than left
set number                      " Always show line numbers
set wildmenu

set expandtab                   " Make spaces not tabs
set tabstop=2                   " 2 space tabs
set shiftwidth=2                " 2 spaces when indented

filetype indent on              " Filetype specific indent
filetype plugin on              " Filetype specific plugins

" Default colors
set background=dark
colorscheme solarized

" Plugin settings
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2

let g:ctrlp_use_caching=0

" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ack 

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Easy navigation of splits
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Easy navigation of splits
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" Create new tab with leader n
noremap <leader>n :tabnew<cr>

" CtrlP to leader t
noremap <leader>t :CtrlP<cr>

" Toggle paste with leader p
set pastetoggle=<leader>p

if has('mouse')
  set mouse=a " Enable mouse
endif

" Use undo file for awesome undo
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undofile
  set undodir=~/.vim/undo/
endif

" Fix terrible terminal delay
if !has('gui_running')
  set timeoutlen=1000
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " If the first arg is a directory, open up nerdtree
  if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
  endif

  " Language Specific Settings
  autocmd FileType text setlocal textwidth=78
  autocmd FileType markdown setlocal wrap

  " Go to last known valid cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Custom tabs
if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let s .= ' '
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      if getbufvar(buflist[winnr - 1], "&modified")
        let s .= ' [+]'
      endif
      let i = i + 1
      let s .= ' '
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set tabline=%!MyTabLine()
endif
