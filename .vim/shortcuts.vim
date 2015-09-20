" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ag! 

" CtrlP to leader p
noremap <leader>p :CtrlP<cr>

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Window resizing
noremap <leader>= <C-w>=

" Easy navigation of tabs
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" Split to current file
nnoremap <leader>eh :Vexplore<cr>
nnoremap <leader>ej :Hexplore<cr>
nnoremap <leader>ek :Hexplore!<cr>
nnoremap <leader>el :Vexplore!<cr>

" Easy navigation of splits
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Git shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>

" Tbro mappings
vmap <silent> <Leader>t :call tbro#run_selection()<cr>
nmap <silent> <Leader>t :call tbro#run_line()<cr>

" Fast tbro thanks to @jyurek
nnoremap ! :Tbro 
nnoremap !! :TbroRedo<cr>

" RSpec mappings for vim-rspec
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Make Y act like other capitals
map Y y$

" Unmap useless keys
noremap Q <Nop>
noremap K <Nop>

noremap <2-LeftMouse> *#
