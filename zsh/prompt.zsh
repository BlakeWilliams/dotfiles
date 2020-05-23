_red() { echo "%{$fg[red]%}" }
_yellow() { echo "%{$fg[yellow]%}" }
_green() { echo "%{$fg[green]%}" }
_blue() { echo "%{$fg[blue]%}" }
_reset() { echo "%{$reset_color%}" }

_bold() { echo "$lc${color[bold]}$rc" }

PROMPT='$(_blue)%1~%{$reset_color%} %(?.$(_yellow).$(_red))λ%{$reset_color%} '
