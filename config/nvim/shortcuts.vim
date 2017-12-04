" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" Ack to leader a
noremap <leader>a :Ack! 

" ALE shortcuts
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

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
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rc :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>

" Make Y act like other capitals
map Y y$

" Unmap useless keys
noremap Q <Nop>
noremap K <Nop>

noremap <2-LeftMouse> *#

nmap <Leader>d :call pry#insert()<cr>

nmap <Leader>b :cal ReverseBackground()<cr>
function! ReverseBackground()
  if &bg=="light"
    set bg=dark
  else
    set bg=light
  endif
endfunction

nmap <leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
