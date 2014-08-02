_red() { echo "%{$fg[red]%}" }
_yellow() { echo "%{$fg[yellow]%}" }
_green() { echo "%{$fg[green]%}" }
_reset() { echo "%{$reset_color%}" }

PROMPT="%1~ %(?.$(_yellow).$(_red))λ%{$reset_color%} "
