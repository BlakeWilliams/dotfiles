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
  autocmd FileType gitcommit setlocal spell " nonumber norelativenumber
  autocmd BufNewFile,BufRead PULLREQ_EDITMSG set syntax=gitcommit
  autocmd FileType netrw setl bufhidden=delete
  autocmd FileType netrw setlocal nonumber relativenumber
  autocmd FileType markdown setlocal spell wrap conceallevel=0
  autocmd FileType qf setlocal cc=""
  autocmd FileType rust setlocal cc=90
  autocmd FileType go setlocal noexpandtab
  autocmd FileType go setlocal shiftwidth=4
  autocmd FileType go setlocal softtabstop=4
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal nolist
  autocmd Filetype json let g:indentLine_setConceal = 0
  autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

  " delete netrw buffers when hidden
  autocmd FileType netrw setl bufhidden=wipe

  augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END

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
