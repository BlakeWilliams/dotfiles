" Show currentline as red
hi CursorLineNr ctermfg=1

function! s:getColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [guiColor, termColor]
endfunction

function! s:setColors()
  if (&t_Co >= 256)
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
    " highlight VertSplit guifg=#073642 guibg=NONE
  endif
endfunction

autocmd ColorScheme * call s:setColors()

let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_undercurl=1
set background=light
" set background=dark
colorscheme gruvbox
