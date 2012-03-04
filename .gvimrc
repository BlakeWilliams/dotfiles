set guifont=monaco:h12 "monaco is boss
set guioptions-=T    "Remove toolbar 
set guioptions-=L    "Remove left scrollbar
set ruler "Ensures a status line
set number "print line number
set showtabline=1 "Always show tabs
set noballooneval " remove tooltips on hover
colorscheme tomorrow-night "Best colorscheme ever

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif
