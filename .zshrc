# Rbenv and Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
eval "$(rbenv init -)"

# Load autocomplete
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Load Colors
autoload -U colors
colors
export CLICOLOR=1

# Add binstubs to path
export PATH=".git/safe/../../bin:$PATH"

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

setopt append_history         # Append, not replace
setopt inc_append_history     # Immediately append history
setopt always_to_end          # Always go to end of line on complete
setopt correct                # Correct typos
setopt hist_ignore_dups       # Don't show dupes in history

# Load all files in ~/.zsh
for function in ~/.zsh/*; do
  source $function
done

# HISTORY!
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Vim like history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Beginning and End line shortcuts
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

