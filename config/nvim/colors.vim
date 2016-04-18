" Default colors
let g:gruvbox_contrast_dark="soft"
set background=dark
colorscheme gruvbox

" Show currentline as red
hi CursorLineNr ctermfg=1

" Tomorrow-Night bg fix
if has("gui_running")
  hi Normal ctermbg=none
endif
