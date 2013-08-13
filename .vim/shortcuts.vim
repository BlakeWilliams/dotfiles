" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ack 

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Easy navigation of splits
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Easy navigation of splits
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" Create new tab with leader n
noremap <leader>n :tabnew<cr>

" CtrlP to leader t
noremap <leader>t :CtrlP<cr>

" RSpec mappings for vim-rspec
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Toggle paste with leader p
set pastetoggle=<leader>p
