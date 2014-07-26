" ctrlp - Don't cache
let g:ctrlp_use_caching=0
let g:ctrlp_map = '<c-p>'

" Use ag instead of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vinegar hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_retmap=1

" disable left click open
let g:netrw_retmap=1

" vim-rspec - Use Dispatch to run rspec
let g:rspec_command="Tbro rspec {spec}"

" airline - set theme and remove stupid separators
let g:airline_theme="base16"
let g:airline_left_sep=''
let g:airline_right_sep=''

" Better col/row information
let g:airline_section_z = "%#__accent_bold#%l%#__restore__#:%c"

" Disable annoying whitespace indicator
let g:airline#extensions#whitespace#enabled=0

" Better tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0

" Don't show modes
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

" Single character modes
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Syntastic config
let g:syntastic_check_on_open = 1 " Check file on open
let g:syntastic_stl_format = " %E{Err: %e}%B{, }%W{Warn: %w}"
