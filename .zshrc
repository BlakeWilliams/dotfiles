# Rbenv and Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
eval "$(rbenv init -)"

# Load autocomplete
autoload -U compinit
compinit

for function in ~/.zsh/*; do
  source $function
done

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

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

# Partial match highlighting
zstyle -e ':completion:*:default' list-colors \
  'reply=("${PREFIX:+=(#bi)($PREFIX:t)()*==34=34}:${(s.:.)LS_COLORS}")'

export EDITOR=vim
export VISUAL=$EDITOR

# All terminals append history, immediately
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Always go to end of line
setopt ALWAYS_TO_END

# Correct me
setopt CORRECT

# Substitute things in prompt
setopt PROMPT_SUBST

# Beginning and End line shortcuts
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# HISTORY!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Ignore duplicates
setopt hist_ignore_dups

# Add binstubs to path
export PATH=".git/safe/../../bin:$PATH"

# Vim like history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
