_red() { echo "%{$fg[red]%}" }
_yellow() { echo "%{$fg[yellow]%}" }
_green() { echo "%{$fg[green]%}" }
_blue() { echo "%{$fg[blue]%}" }
_reset() { echo "%{$reset_color%}" }

_bold() { echo "$lc${color[bold]}$rc" }

PROMPT='$(_blue)%1~%{$reset_color%} %(?.$(_yellow).$(_red))λ%{$reset_color%} '

autoload -Uz vcs_info
precmd() { vcs_info }

# # Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
RPROMPT=' %B$(_green)${vcs_info_msg_0_}%{$reset_color%}'
