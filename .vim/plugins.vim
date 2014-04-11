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

" vim-rspec - Use Dispatch to run rspec
let g:rspec_command="Dispatch rspec {spec}"

" airline - set theme and remove stupid separators
let g:airline_theme="base16"
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#whitespace#show_message = 0

" Syntastic config
let g:syntastic_check_on_open = 1 " Check file on open

" Additional Checkers
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_scss_checkers = ['scss_lint']
