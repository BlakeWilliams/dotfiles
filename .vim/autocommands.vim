" Fix terrible terminal delay
if !has('gui_running')
  set timeoutlen=1000
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

if has("autocmd")
  " If the first arg is a directory, open up nerdtree
  " if isdirectory(argv(0))
  "   bd
  "   autocmd vimenter * exe "cd" argv(0)
  "   autocmd VimEnter * NERDTree
  " endif

  " Language Specific Settings
  autocmd FileType text setlocal textwidth=78
  autocmd FileType gitcommit setlocal spell number norelativenumber
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal wrap

  " Go to last known valid cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
