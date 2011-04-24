syntax on
set autowrite "save files before :make or :next
set nocompatible  "Remove vi compatibility
set hidden "Enable unsaved buffers 
set backupcopy=yes "Keeps original creator code
set hlsearch "Highlights search
set noerrorbells "Obvious
set backspace=indent,eol,start "Adds intuitive backspacing
"set visualbell "
set fdc=1 "Fold column width
set backup "Make backup before overwriting file
set backupdir=~/.vim/backup "Custom location for backups
set directory=~/.vim/tmp "Location for the swap file
set showmatch "Show matching paren/brace/bracket
set ignorecase "Ignore case in searches
set smarttab "Prevents tab/space fuckling
set autoindent smartindent "Use line current indent level & interpret the next liens level
set undolevels=500 "More undo!
filetype on "Find filetype
filetype indent on "Filetype specific indent
filetype plugin on "Filetype specific plugins
set wildmenu
set history=100		" keep 50 lines of command line history
set showcmd "Show command in the last line of the screen
set incsearch "Searches for text as entered
" Tab stuff!
set expandtab "Make spaces not tabs
set tabstop=4 "4 space tabs
au FileType ruby setl shiftwidth=4 tabstop=4
set shiftwidth=4 "4 spaces when indented
if has("gui_running")  "Gui only
   set guifont=monaco:h12 "monaco is boss
   set guioptions-=T    "Remove toolbar"
   set ruler "Ensures a status line
   set number "print line number
   colorscheme molokai "Best colorscheme so far	
   set showtabline=2 "Always show tabs
endif
map Q gq
inoremap <C-U> <C-G>u<C-U>
if has('mouse')
   set mouse=a "MOUSE!
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
   " Enable file type detection.
   " Use the default filetype settings, so that mail gets 'tw' set to 72,
   " 'cindent' is on in C files, etc.
   " Also load indent files, to automatically do language-dependent indenting.
   filetype plugin indent on

   " Put these in an autocmd group, so that we can delete them easily.
   augroup vimrcEx
      au!

      " For all text files set 'textwidth' to 78 characters.
      autocmd FileType text setlocal textwidth=78
      " Language Specific Settings
      autocmd FileType ruby setlocal shiftwidth=3 tabstop=3

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      " Also don't do it when the mark is in the first line, that is the default
      " position when opening a file.
      autocmd BufReadPost *
               \ if line("'\"") > 1 && line("'\"") <= line("$") |
               \   exe "normal! g`\"" |
               \ endif

   augroup END

else


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif

