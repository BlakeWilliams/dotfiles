" NERDTree - minimal ui, follow tree and autodelete buffers
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=0

" Split model, not drawer model
let NERDTreeHijackNetrw=1

" ctrlp - Don't cache
let g:ctrlp_use_caching=0

" vim-rspec - Use Dispatch to run rspec
let g:rspec_command="Dispatch rspec {spec}"

" vim-slime - Use tmux
let g:slime_target="tmux"

" airline - set theme and remove stupid separators
let g:airline_theme="base16"
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#whitespace#show_message = 0

" vim-slime config
let g:slime_target = "tmux"
