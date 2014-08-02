syntax on

set autoindent                  " Copy indent from previous line
set backupcopy=yes              " Keeps original creator code
set backspace=indent,eol,start  " Adds intuitive backspacing
set colorcolumn=80              " Highlight line 80
set gdefault                    " When on a line, replace all matches in line
set history=100		              " keep 100 lines of command line history
set hlsearch                    " Highlights search
set ignorecase                  " Ignore case in searches
set incsearch                   " Searches for text as entered
set laststatus=2                " Always show statusline
set list                        " Don't show listchars
set listchars=tab:»·,trail:·    " Show trailing spaces as dots
set nobackup                    " No Backup files
set noerrorbells                " Obvious
set hidden                      " Allow hiding of unsaved buffers
set number                      " Show regular numbers
set noshowcmd                   " Don't show command in the last line of the screen
set noswapfile                  " No swap
set nowrap                      " Don't wrap lines
set relativenumber              " Show relative line numbers
set ruler                       " Show the ruler
set showmatch                   " Highlight matching paren/brace/bracket
set smartindent                 " Auto insert extra indent level in certain cases
set smarttab                    " Prevents tab/space issues
set splitbelow                  " Open hsplits below rather than above
set splitright                  " Open vsplits to the right rather than left
set ttyfast                     " Add g flag to search and replace as default
set undolevels=500              " More undo
set wildmenu

" Formatting settings
set expandtab                   " Make spaces not tabs
set tabstop=2                   " 2 space tabs
set shiftwidth=2                " 2 spaces when indented

filetype indent on              " Filetype specific indent
filetype plugin on              " Filetype specific plugins

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

" Vim and OS share clipboard
if exists("+clipboard")
  set clipboard=unnamed
endif

" Indent tags properly
let g:html_indent_tags = 'li\|p'
