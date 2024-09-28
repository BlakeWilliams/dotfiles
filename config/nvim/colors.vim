" Show currentline as red
hi CursorLineNr ctermfg=1

hi! link CocErrorVirtualText Error
hi! link TSString Yellow
hi! link netrwSymLink Comment

hi! link LspDiagnosticsVirtualTextError Error
hi! link LspDiagnosticsVirtualTextWarning Yellow
hi! link LspDiagnosticsVirtualTextInformation Green
hi! link LspDiagnosticsVirtualTextHint Green

hi! link LspDiagnosticsVirtualTextHint Green

hi! link lualine_b_diagnostics_error_normal Yellow
hi! link lualine_b_diagnostics_error_insert Green

hi! link LspReferenceRead Error
hi! link LspReferenceText Yellow
hi! link LspReferenceWrite Yellow

let g:everforest_enable_italic = 1
let g:everforest_material_background = 'hard'
let g:airline_theme="everforest"

set background=dark
colorscheme everforest

let s:bgFile = expand("~/.config/nvim/background")
let s:modeFile = expand("~/.config/nvim/colormode")

function! SyncBG(timer)
  if filereadable(s:bgFile)
    let value = readfile(s:bgFile)[0]
    if g:colors_name != value
      exec 'colorscheme ' . value
    endif
  endif

  if filereadable(s:modeFile)
    let value = readfile(s:modeFile)[0]
    if value == "light" && &background != value
      set background=light
    elseif &background != value
      set background=dark
    endif
  endif
endfunction

exec timer_start(5000, 'SyncBG', {'repeat': -1})

call SyncBG(0)

function! s:SetTermColors()
  let tty='/dev/'.system('ps -o tty= $(ps -o ppid= $(ps -o ppid= $$))')

  let cmd = s:SetColor('11', synIDattr(synIDtrans(hlID("Normal")), "bg#"))
  let cmd = cmd . " " . s:SetColor('10', synIDattr(synIDtrans(hlID("Normal")), "fg#"))
  let cmd = cmd . " " . s:SetColor('12', synIDattr(synIDtrans(hlID("TermCursor")), "fg#"))
  let cmd = cmd . " " . s:SetColor('4;0', g:terminal_color_0)
  let cmd = cmd . " " . s:SetColor('4;1', g:terminal_color_1)
  let cmd = cmd . " " . s:SetColor('4;2', g:terminal_color_2)
  let cmd = cmd . " " . s:SetColor('4;3', g:terminal_color_3)
  let cmd = cmd . " " . s:SetColor('4;4', g:terminal_color_4)
  let cmd = cmd . " " . s:SetColor('4;5', g:terminal_color_5)
  let cmd = cmd . " " . s:SetColor('4;6', g:terminal_color_6)
  let cmd = cmd . " " . s:SetColor('4;7', g:terminal_color_7)
  let cmd = cmd . " " . s:SetColor('4;8', g:terminal_color_8)
  let cmd = cmd . " " . s:SetColor('4;9', g:terminal_color_9)
  let cmd = cmd . " " . s:SetColor('4;10', g:terminal_color_10)
  let cmd = cmd . " " . s:SetColor('4;11', g:terminal_color_11)
  let cmd = cmd . " " . s:SetColor('4;12', g:terminal_color_12)
  let cmd = cmd . " " . s:SetColor('4;13', g:terminal_color_13)
  let cmd = cmd . " " . s:SetColor('4;14', g:terminal_color_14)
  let cmd = cmd . " " . s:SetColor('4;15', g:terminal_color_15)

  silent execute ":!" . 'printf "' . cmd . '" > ' . tty

  echon ''
  redraw

  call writefile([g:colors_name], s:bgFile)

  if &background ==# "dark"
    call writefile(["dark"], s:modeFile)
  else
    call writefile(["light"], s:modeFile)
  endif
endfunction

function! s:SetColor(i, color)
  let printcmdstart = '\033Ptmux;\033\033]'
  let printcmdend = '\007\033\\'

  return printcmdstart . a:i . ";\\" . a:color . printcmdend
endfunction

augroup AutoColor
  autocmd ColorScheme * silent call s:SetTermColors()
augroup END
