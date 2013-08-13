set statusline=%f\ 
set statusline+=%m%{SpaceIf(&mod)}
set statusline+=%{SpaceIf(&readonly)}%*
set statusline+=\ %=
set statusline+=\ %{GetBranch()}

" focus, byfname, s:regexp, prv, item, nxt, marked
" a:1    a:2      a:3       a:4  a:5   a:6  a:7
fu! CtrlP_Statusline_1(...)
  let prv = '%#ctrlp# '.a:4.' %*'
  let item = '%#ctrlpcurrent# '.a:5.' %*'
  let nxt = '%#ctrlp# '.a:6.' '
  let dir = ' %=%<%*%#ctrlp# '.getcwd().' %*'
  retu prv.item.nxt.dir
endf
let g:ctrlp_status_func = { 'main': 'CtrlP_Statusline_1', }

" Util functions
function! GetBranch()
  let ret = substitute(fugitive#statusline(), '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', 'BR:' .' \1', 'g')
  return ret
endfunction

function! SpaceIf(bool)
  if a:bool
    return ' '
  endif
  return ''
endfunction
