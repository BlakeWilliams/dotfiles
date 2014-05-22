" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ag! -i 

" CtrlP to leader p
noremap <leader>p :CtrlP<cr>

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Easy navigation of splits
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Map window movements
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Window resizing
noremap <leader>= <C-w>=

" Easy navigation of tabs
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" Create splits easily that open netrw with defaults 
nnoremap <leader>s :Vexplore! .<cr>
nnoremap <leader>e :Vexplore!<cr>

" Split to root
nnoremap <leader>sh :Vexplore .<cr>
nnoremap <leader>sj :Hexplore .<cr>
nnoremap <leader>sk :Hexplore! .<cr>
nnoremap <leader>sl :Vexplore! .<cr>

" Split to current file
nnoremap <leader>eh :Vexplore<cr>
nnoremap <leader>ej :Hexplore<cr>
nnoremap <leader>ek :Hexplore!<cr>
nnoremap <leader>el :Vexplore!<cr>

" Prepend Dispatch for easy commands
nnoremap <leader>d :Dispatch 

" Git shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gg :Gbrowse<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>

" RSpec mappings for vim-rspec
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Toggle relative and non-relative line numbers
map <Leader>n :call ToggleNumber()<cr>

" Toggle syntastic error window
map <Leader>c :call ToggleErrors()<cr>

function! ToggleNumber()
  if &relativenumber
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
  endif
endfunction
