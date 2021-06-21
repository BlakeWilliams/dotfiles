_red() { echo "%{$fg[red]%}" }
_magenta() { echo "%{$fg[magenta]%}" }
_green() { echo "%{$fg[green]%}" }
_blue() { echo "%{$fg[blue]%}" }
_reset() { echo "%{$reset_color%}" }

_bold() { echo "$lc${color[bold]}$rc" }

PROMPT='$(_blue)%1~%{$reset_color%} %(?.$(_magenta).$(_red))❯%{$reset_color%} '
