" Show currentline as red
hi CursorLineNr ctermfg=1

set background=dark

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_current_word = 'underline'
let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material
let g:airline_theme="gruvbox_material"

hi link CocErrorVirtualText Error
hi! link TSString Yellow
hi! link netrwSymLink Comment
