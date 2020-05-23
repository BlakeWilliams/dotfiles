" Show currentline as red
hi CursorLineNr ctermfg=1

function! s:getColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [guiColor, termColor]
endfunction

function! s:setColors()
  if (&t_Co >= 256)
    hi illuminatedWord cterm=underline gui=underline

    execute 'highlight jsObjectKey guifg=' . s:getColor('GruvboxAqua')[0]
    execute 'highlight jsImport guifg=' . s:getColor('GruvboxRed')[0]
    execute 'highlight jsImport guifg=' . s:getColor('GruvboxRed')[0]
    execute 'highlight jsFuncCall guifg=' . s:getColor('GruvboxBlue')[0]
    execute 'highlight jsonString guifg=' . s:getColor('GruvboxGreen')[0]
    execute 'highlight jsonKeyword guifg=' . s:getColor('GruvboxBlue')[0]
    execute 'highlight ALEErrorSign guibg=NONE guifg=' s:getColor('GruvboxRed')[0]
    execute 'highlight ALEWarningSign guibg=NONE guifg=' s:getColor('GruvboxYellow')[0]
    execute 'highlight CursorLineNr guibg=NONE'

    execute 'highlight Events guifg=' s:getColor('GruvboxBlue')[0]
    hi! link Operator GruvboxFg1
    " highlight VertSplit guifg=#073642 guibg=NONE
  endif
endfunction


let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="medium"
let g:gruvbox_italic=1
let g:gruvbox_undercurl=1
let g:nord_italic_comments = 1
set background=dark

colorscheme iceberg
let g:airline_theme="iceberg"
