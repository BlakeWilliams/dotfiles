# Rbenv and Brew
eval "$(rbenv init -)"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load autocomplete
autoload -U compinit
compinit

#Load Colors
autoload -U colors
colors

export CLICOLOR=1

# Show ls on dark backgrounds well
unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS=gxfxcxdxbxegedabagacad

# Grep gets colors too
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;32'

export EDITOR=vim
export VISUAL=$EDITOR

# All terminals append history, immediately
setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY

# Always go to end of line
setopt ALWAYS_TO_END 

# Correct me
setopt CORRECT

#Custom prompt, username:directory lightning bolt
PROMPT="%n:%1~ %(?.%{$fg[yellow]%}.%{$fg[red]%})⚡%{$reset_color%} "

# HISTORY!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Interactive comments!
setopt INTERACTIVE_COMMENTS

if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
    function chpwd {
        local SEARCH=' '
        local REPLACE='%20'
        local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
        printf '\e]7;%s\a' "$PWD_URL"
    }

    chpwd
}
