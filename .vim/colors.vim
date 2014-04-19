" Default colors
set background=dark
colorscheme base16-tomorrow

hi SyntasticErrorSign ctermfg=1 ctermbg=10
hi CursorLineNr ctermfg=1

" Tomorrow-Night bg fix
if has("gui_running")
  hi Normal ctermbg=none
endif
