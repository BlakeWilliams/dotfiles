set guifont=menlo:h12 "monaco is boss
set guioptions-=T    "Remove toolbar 
set guioptions-=L    "Remove left scrollbar
set ruler "Ensures a status line
set number "print line number
set showtabline=1 "Always show tabs
set noballooneval " remove tooltips on hover

"set background=dark
colorscheme tomorrow-night "Best colorscheme ever
"hi NonText guifg=bg

" Plugin settings
let g:ctrlp_max_height = 30

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CtrlP<CR>
endif

