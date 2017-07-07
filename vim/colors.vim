" Show currentline as red
hi CursorLineNr ctermfg=1

function! s:getGruvColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [guiColor, termColor]
endfunction

function! s:setColors()
  if (&t_Co >= 256)
    execute 'highlight jsObjectKey guifg=' . s:getGruvColor('GruvboxAqua')[0]
    execute 'highlight jsImport guifg=' . s:getGruvColor('GruvboxRed')[0]
    execute 'highlight jsImport guifg=' . s:getGruvColor('GruvboxRed')[0]
    execute 'highlight jsFuncCall guifg=' . s:getGruvColor('GruvboxBlue')[0]
    execute 'highlight jsonString guifg=' . s:getGruvColor('GruvboxGreen')[0]
    execute 'highlight jsonKeyword guifg=' . s:getGruvColor('GruvboxBlue')[0]
    execute 'highlight ALEErrorSign guibg=NONE guifg=' s:getGruvColor('GruvboxRed')[0]
    execute 'highlight ALEWarningSign guibg=NONE guifg=' s:getGruvColor('GruvboxYellow')[0]

    highlight VertSplit guifg=#333333 guibg=NONE
  endif
endfunction

autocmd ColorScheme * call s:setColors()

let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="hard"
set background=light
colorscheme gruvbox
