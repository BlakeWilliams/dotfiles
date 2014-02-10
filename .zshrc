# Rbenv and Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
eval "$(rbenv init -)"

autoload -U compinit
compinit

for function in ~/.zsh/*; do
  source $function
done

# Load autocomplete
autoload -U compinit
compinit

# Load Colors
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

# Beginning and End line shortcuts
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# Custom prompt, username:directory lightning bolt
PROMPT="%1~ %(?.%{$fg[yellow]%}.%{$fg[red]%})λ%{$reset_color%} "

# HISTORY!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Add binstubs to path 
export PATH=".git/safe/../../bin:$PATH"
