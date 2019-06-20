" Show currentline as red
hi CursorLineNr ctermfg=1

function! s:getColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [guiColor, termColor]
endfunction

function! s:setNordColors()
  if (&t_Co >= 256)
    execute 'highlight typescriptVariable guifg=' s:getColor('Keyword')[0]
    execute 'highlight typescriptTypeReference guifg=' s:getColor('Type')[0]
    execute 'highlight typescriptImport guifg=' s:getColor('Type')[0]
    execute 'highlight typescriptImport guifg=' s:getColor('Type')[0]

    execute 'highlight CocInfoHighlight gui=underline guifg=' s:getColor('TODO')[0]
    execute 'highlight CocWarningHighlight gui=underline guifg=' s:getColor('Error')[0]
    execute 'highlight CocErrorHighlight gui=underline guifg=' s:getColor('SpellBad')[0]
  endif
endfunction

autocmd ColorScheme * call s:setNordColors()

let g:nord_italic_comments = 1
set background=dark
colorscheme nord
