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
  " Language Specific Settings
  autocmd FileType text setlocal textwidth=78
  autocmd FileType gitcommit setlocal spell number norelativenumber
  autocmd FileType netrw setlocal nonumber norelativenumber
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal wrap
  "Disable ctrl+h in netrw for split movement
  autocmd FileType netrw unmap <buffer> <C-h>
  autocmd FileType netrw setlocal cc=""
  autocmd FileType qf setlocal cc=""

  " Start with tree open
  if isdirectory(argv(0))
    autocmd VimEnter * e
  endif

  " Go to last known valid cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Makes parent directories if they don't exist
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
