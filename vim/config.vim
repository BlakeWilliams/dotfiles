syntax on

set autoindent                  " Copy indent from previous line
set backupcopy=yes              " Keeps original creator code
set backspace=indent,eol,start  " Adds intuitive backspacing
set colorcolumn=80              " Highlight line 80
set diffopt+=vertical           " Always use vertical diffs
set fillchars+=vert:│           " Use tall pipe in split separators
" set gdefault                  " When on a line, replace all matches in line
set history=100                 " Keep 100 lines of command line history
set hlsearch                    " Highlights search
set ignorecase                  " Ignore case in searches
set incsearch                   " Searches for text as entered
set laststatus=2                " Always show statusline
set lazyredraw                  " Don't always redraw the screen
set list                        " Don't show listchars
set listchars=tab:»·,trail:·    " Show trailing spaces as dots
set matchtime=0                 " Fix neovim match lag
set nobackup                    " No Backup files
set noerrorbells                " Obvious
set nohidden                    " Don't hide unsaved buffers
set nofoldenable                " Folding isn't useful and might slow things down
set number                      " Show regular numbers
set noshowcmd                   " Don't show command in the last line of the screen
set noswapfile                  " No swap
set nowrap                      " Don't wrap lines
set relativenumber              " Show relative line numbers
set ruler                       " Show the ruler
set scrolloff=5                 " Always show 5 lines above/blow cursor
set completeopt+=menuone        " Always show menu
" set completeopt+=noselect       " Don't select only option
set complete+=kspell            " autocomplete with dictionary
set shortmess=fmnrWIcF          " Customize what vim yells at you
set showmatch                   " Highlight matching paren/brace/bracket
set smartcase                   " Enable case sensetive search only when uppsercase characters present
set smartindent                 " Auto insert extra indent level in certain cases
set smarttab                    " Prevents tab/space issues
set splitbelow                  " Open hsplits below rather than above
set splitright                  " Open vsplits to the right rather than left
set tags=.git/tags              " Where to find tags
set termguicolors               " 256 colors!
set ttyfast                     " Let vim know we're always on a fast connection
set undolevels=500              " More undo
set wildignorecase              " Case insensitive completions
set wildmenu

" Enable italics
set t_ZH=[3m
set t_ZR=[23m

set t_8f=[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=[48;2;%lu;%lu;%lum  " Ditto

" Formatting settings
set expandtab                   " Make spaces not tabs
" set tabstop=2                   " 2 space tabs
set shiftwidth=2                " 2 spaces when indented

filetype indent on              " Filetype specific indent
filetype plugin on              " Filetype specific plugins

if has('mouse')
  set mouse=a
endif

" Use undo file for awesome undo
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undofile
  set undodir=~/.vim/undo/
endif
