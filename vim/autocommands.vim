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
  autocmd FileType gitcommit setlocal spell nonumber norelativenumber
  " autocmd FileType netrw setl bufhidden=delete
  autocmd FileType netrw setlocal nonumber relativenumber
  autocmd FileType markdown setlocal spell wrap textwidth=80
  autocmd FileType qf setlocal cc=""
  autocmd FileType rust setlocal cc=90
  autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
  autocmd FileType ruby setlocal re=1

  " Add ES6 extension
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  " Go to last known valid cursor position
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
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
