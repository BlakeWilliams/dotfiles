" Indent li and p tags properly
let g:html_indent_tags = 'li\|p'

" ctrlp - Don't cache
let g:ctrlp_use_caching=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_reuse_window = 'netrw'
let g:ctrlp_types = ['fil', 'mru', 'tags']
let g:ctrlp_extensions = ['tag']

" Use ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'
endif

" vinegar hide dotfiles
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nonumber'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_retmap = 1

" disable left click open
let g:netrw_retmap = 1

" disable netrw history
let g:netrw_dirhistmax = 0

" vim-rspec - Use Tbro to run rspec
let g:rspec_command = "Tbro bundle exec rspec {spec}"

" Set airline theme
let g:airline_theme="gruvbox"

" Don't use new symbols symbols
let g:airline_symbols_ascii = 1

" Disable annoying whitespace indicator
let g:airline#extensions#whitespace#enabled=0

" Better tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#ale#enabled = 1

" Don't show modes
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

" Better line/column information
let g:airline_section_b = ""
let g:airline_section_z = "%#__accent_bold#%l%#__restore__#:%c"

let g:ale_sign_error="△"
let g:ale_sign_warning="✕"

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

let g:flow#enable = 0

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

let g:test#custom_strategies = {'tbro': function('tbro#send')}
let g:test#strategy = 'tbro'

" For whatever reason this plugin overrides conceallevel
let g:indentLine_conceallevel = 0

let g:UltiSnipsSnippetsDir = "~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"
" let g:UltiSnipsExpandTrigger="<Nop>"

" let g:ulti_expand_or_jump_res = 0
" function! Ulti_ExpandOrJump_and_getRes()
"     call UltiSnips#ExpandSnippetOrJump()
"     return g:ulti_expand_or_jump_res
" endfunction

" inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" " let g:deoplete#auto_complete_delay = 10
" let g:deoplete#auto_complete_start_length = 3
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#sources = {}
" let g:deoplete#sources = ['buffer', 'tag', 'around']
" call deoplete#custom#set('ultisnips', 'rank', 1000)
" call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
