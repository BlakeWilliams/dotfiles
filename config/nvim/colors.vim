" Show currentline as red
hi CursorLineNr ctermfg=1

set background=dark

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_current_word = 'underline'

colorscheme gruvbox-material
let g:airline_theme="gruvbox_material"

hi link CocErrorVirtualText Error
highlight! link TSString Yellow
