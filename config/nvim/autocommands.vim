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

function! s:SetTermColors()
  let tty='/dev/'.system('ps -o tty= $(ps -o ppid= $(ps -o ppid= $$))')

  let cmd = s:SetColor('11', synIDattr(synIDtrans(hlID("Normal")), "bg#"))
  let cmd = cmd . " " . s:SetColor('10', synIDattr(synIDtrans(hlID("Normal")), "fg#"))
  let cmd = cmd . " " . s:SetColor('12', synIDattr(synIDtrans(hlID("TermCursor")), "fg#"))
  let cmd = cmd . " " . s:SetColor('4;0', g:terminal_color_0)
  let cmd = cmd . " " . s:SetColor('4;1', g:terminal_color_1)
  let cmd = cmd . " " . s:SetColor('4;2', g:terminal_color_2)
  let cmd = cmd . " " . s:SetColor('4;3', g:terminal_color_3)
  let cmd = cmd . " " . s:SetColor('4;4', g:terminal_color_4)
  let cmd = cmd . " " . s:SetColor('4;5', g:terminal_color_5)
  let cmd = cmd . " " . s:SetColor('4;6', g:terminal_color_6)
  let cmd = cmd . " " . s:SetColor('4;7', g:terminal_color_7)
  let cmd = cmd . " " . s:SetColor('4;8', g:terminal_color_8)
  let cmd = cmd . " " . s:SetColor('4;9', g:terminal_color_9)
  let cmd = cmd . " " . s:SetColor('4;10', g:terminal_color_10)
  let cmd = cmd . " " . s:SetColor('4;11', g:terminal_color_11)
  let cmd = cmd . " " . s:SetColor('4;12', g:terminal_color_12)
  let cmd = cmd . " " . s:SetColor('4;13', g:terminal_color_13)
  let cmd = cmd . " " . s:SetColor('4;14', g:terminal_color_14)
  let cmd = cmd . " " . s:SetColor('4;15', g:terminal_color_15)


  silent execute ":!" . 'printf "' . cmd . '" > ' . tty
  echon ''
  redraw
endfunction

function! s:SetColor(i, color)
  let printcmdstart = '\033Ptmux;\033\033]'
  let printcmdend = '\007\033\\'

  return printcmdstart . a:i . ";\\" . a:color . printcmdend
endfunction

augroup AutoColor
  autocmd ColorScheme * :call s:SetTermColors()
augroup END
