" Default colors
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_contrast_light="hard"
set background=light
colorscheme gruvbox

" Show currentline as red
hi CursorLineNr ctermfg=1

" Tomorrow-Night bg fix
if has("gui_running")
  hi Normal ctermbg=none
endif
