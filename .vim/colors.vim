" Default colors
set background=light
colorscheme base16-tomorrow

" Hack for better search on light bg's
hi Search ctermbg=3 ctermfg=13

hi SyntasticErrorSign ctermfg=1 ctermbg=10
hi CursorLineNr ctermfg=1

hi SneakPluginTarget ctermbg=3 ctermbg=1

" Tomorrow-Night bg fix
if has("gui_running")
  hi Normal ctermbg=none
endif
