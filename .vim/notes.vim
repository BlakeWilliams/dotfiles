nnoremap <leader>n :call OpenNotes()<cr>

function! OpenNotes()
  edit ~/.notes.md
  nnoremap <buffer> - :b1<cr>
  nnoremap <buffer> <Leader>o za

  function! GetHeaderFold(lnum)
    let l1 = getline(a:lnum)

    if l1 =~ '^\s*$'
      return '-1'
    elseif l1 =~ '^###'
      return '>3'
    elseif l1 =~ '^##'
      return '>2'
    elseif l1 =~ '^#'
      return '>1'
    else
      return '='
    endif
  endfunction

  setlocal ft=markdown
  setlocal foldexpr=GetHeaderFold(v:lnum)
  setlocal foldmethod=expr

  setlocal foldenable
  setlocal foldlevel=0
  setlocal foldcolumn=0
endfunction
