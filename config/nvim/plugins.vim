" Indent li and p tags properly
let g:html_indent_tags = 'li\|p'

" Ruby indents
let g:ruby_indent_assignment_style = 'variable'

" vinegar hide dotfiles
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro nonumber'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_retmap = 1
let g:netrw_fastbrowse = 0

" disable left click open
let g:netrw_retmap = 1

" disable netrw history
let g:netrw_dirhistmax = 0

" Render signify as lines
let g:signify_sign_add = "│ "
let g:signify_sign_delete = "│ "
let g:signify_sign_change = "│ "
let g:signify_sign_change_delete = "│ "
let g:signify_sign_show_count = 0

" Don't use scrollbar
let g:airline#extensions#scrollbar#enabled = 0

" Disable annoying whitespace indicator
let g:airline#extensions#whitespace#enabled=0

" Better tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ale#enabled = 1

" Disable airline search
let g:airline#extensions#localsearch#enabled = 0
let g:airline#extensions#searchcount#enabled = 0

" Better line/column information
let g:airline_section_b = ""
let g:airline_section_z = "%#__accent_bold#%l%#__restore__#:%c"

" Disable ALE's LSP support, it is for linters
let g:ale_disable_lsp = 1

let g:ale_fix_on_save=1

let g:ale_sign_error="✕"
let g:ale_sign_warning="!"
let g:ale_sign_info ="i"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\   'go': ['golangci-lint', 'govet', 'gofmt', 'gopls'],
\}
let g:ale_go_golangci_lint_options = '--fast'
let g:ale_go_golangci_lint_package=1

" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'typescript': ['prettier'],
" \   'vue': ['prettier'],
" \}

let g:ale_lint_on_text_changed = 0

" only run rubocop if ruby code has opted in
let g:ale_ruby_rubocop_executable = "bundle exec rubocop"

let g:ale_virtualtext_cursor = 1

let g:test#custom_strategies = {'tbro': function('tbro#send')}
let g:test#strategy = 'tbro'

" Don't hide quotes in json
let g:vim_json_syntax_conceal = 0

" Go config

let g:Illuminate_ftblacklist = ['netrw']

function! s:fzf_statusline()
  highlight fzf1 ctermfg=7 ctermbg=2
  highlight fzf2 ctermfg=7 ctermbg=2
  highlight fzf3 ctermfg=7 ctermbg=2
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg call fzf#vim#grep(
      \ "rg --hidden --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
      \ 1,
      \ {'options': '--delimiter : --nth 2.. --with-nth 1,4 --preview="bat {1} -H {2}" --preview-window +{2}-/2'},
      \ <bang>0
      \)

" custom projections
let g:rails_projections = {
\ "test/integration/*_test.rb": {
\   "type": "integration test",
\   "alternate": "app/controllers/{}.rb"
\ },
\ "app/controllers/*_controller.rb": {
\    "affinity": "controller",
\    "template": [
\      "class {camelcase|capitalize|colons}Controller < ApplicationController",
\      "end"
\    ],
\    "type": "controller",
\    "alternate": "test/integration/{}_controller_test.rb"
\ }
\}

let g:projectionist_heuristics = {
\ '*.go': {
\   '*.go': {
\       'alternate': '{}_test.go',
\       'type': 'source'
\   },
\   '*_test.go': {
\       'alternate': '{}.go',
\       'type': 'test'
\   },
\ }
\}

let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
