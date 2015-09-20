" Default colors
set background=dark
colorscheme solarized

" Hack for better search on light bg's
hi Search ctermbg=3 ctermfg=0

" Show currentline as red
hi CursorLineNr ctermfg=1

" Tomorrow-Night bg fix
if has("gui_running")
  hi Normal ctermbg=none
endif
