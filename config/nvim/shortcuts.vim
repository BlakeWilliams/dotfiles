" Remap leader to <space>
noremap <space> <Nop>
let mapleader = " "

" FZF Rg to leader a (Ack)
noremap <leader>a :Rg<CR>
noremap <leader>f :Grepper<CR>

" ALE shortcuts
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" FZF Files to leader p
noremap <C-p> :Files<cr>

" Double <space> to noh
noremap <leader><space> :noh<cr>

" Easy navigation of splits
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Git shortcuts
map <leader>gs :Git<cr>
map <leader>gc :Git commit<cr>
map <leader>gg :GBrowse<cr>
map <leader>gb :Git blame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gb :BCommits<cr>

" Tbro mappings
vmap <silent> <Leader>t :call tbro#run_selection()<cr>
nmap <silent> <Leader>t :call tbro#run_line()<cr>

" Fast tbro thanks to @jyurek
nnoremap ! :Tbro 
nnoremap !! :TbroRedo<cr>

" Test mappings for vim-test
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

nmap <Leader>b :Buffers<cr>

nmap <leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
