" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ag -i 

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Easy navigation of splits
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Map window movements
noremap <leader>H <C-w>H
noremap <leader>J <C-w>J
noremap <leader>K <C-w>K
noremap <leader>L <C-w>L

noremap <leader>r <C-w>r
noremap <leader>R <C-w>R

" Move window to new tab
noremap <leader>T <C-w>T

" Window resizing
noremap <leader>= <C-w>=

" Easy navigation of tabs
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" Quick browsing
nnoremap <leader>e :e .<cr>

" Create splits easily that open netrw with default right split
nnoremap <leader>s :Vexplore!<cr> 
nnoremap <leader>S :Vexplore!<cr> 

nnoremap <leader>sh :Vexplore<cr>
nnoremap <leader>sk :Hexplore!<cr>
nnoremap <leader>sj :Hexplore<cr>
nnoremap <leader>sl :Vexplore!<cr>

" CtrlP to leader t
noremap <leader>t :CtrlP<cr>

" Git shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>

" RSpec mappings for vim-rspec
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Toggle relative and non-relative line numbers
map <Leader>n :call ToggleNumber()<cr>

function! ToggleNumber()
  if &number
    set nonumber
    set relativenumber
  else
    set number
    set norelativenumber
  endif
endfunction
