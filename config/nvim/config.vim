syntax on

set autoindent                  " Copy indent from previous line
set backupcopy=yes              " Keeps original creator code
set backspace=indent,eol,start  " Adds intuitive backspacing
set fillchars+=vert:│           " Use tall pipe in split separators
set cursorline                  " highlight current line
set guicursor=i:ver25-iCursor   " Use | cursor when in insert mode
set history=100                 " Keep 100 lines of command line history
set hlsearch                    " Highlights search
set ignorecase                  " Ignore case in searches
set incsearch                   " Searches for text as entered
if has('nvim-0.7.0')
  set laststatus=3                " Always show one statusline
else
  set laststatus=2                " Always show statusline
endif
set lazyredraw                  " Boosts performance at times
set list                        " Don't show listchars
set listchars=tab:»·,trail:·    " Show trailing spaces as dots
set matchtime=0                 " Fix neovim match lag
set nobackup                    " No Backup files
set noerrorbells                " Obvious
set hidden                      " hide unsaved buffers
set number                      " Show regular numbers
set nofoldenable                " Disable folds
set noshowcmd                   " Don't show command in the last line of the screen
set noswapfile                  " No swap
"set noautoread                  " Don't automatically read files when they are changed
set nowrap                      " Don't wrap lines
set relativenumber              " Show relative line numbers
set ruler                       " Show the ruler
set scrolloff=10                " Always keep current line in center
set completeopt+=menuone        " Always show menu
set completeopt+=noselect       " Don't select only option
set shortmess=fmnrWIcF          " Customize what vim yells at you
set showmatch                   " Highlight matching paren/brace/bracket
set smartcase                   " Enable case sensetive search only when uppsercase characters present
set smartindent                 " Auto insert extra indent level in certain cases
set smarttab                    " Prevents tab/space issues
set synmaxcol=180               " Prevents segfaults and slow rendering
set noshowmode              " Don't show mode since lualine handles it
set splitbelow                  " Open hsplits below rather than above
set splitright                  " Open vsplits to the right rather than left
set tags^=.git/tags             " where to find tags
set termguicolors               " 256 colors!
set undolevels=500              " More undo
set wildignorecase              " Case insensitive completions
set wildmenu

set signcolumn=yes:1

" Formatting settings
set expandtab                   " Make spaces not tabs
set shiftwidth=2                " 2 spaces when indented

filetype indent on              " Filetype specific indent
filetype plugin on              " Filetype specific plugins

if has('mouse')
  set mouse=a
endif

" Use undo file for awesome undo
if exists("+undofile")
  if isdirectory($HOME . '/.config/nvim/undo') == 0
    :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
  endif

  set undofile
  set undodir=~/.config/nvim/undo/
endif

" Better diffing
if &diff && has("patch-8.1.0360")
  set diffopt+=internal,algorithm:patience,vertical
endif
