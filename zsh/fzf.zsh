#!/usr/bin/env zsh

# Load fzf if it is installed and exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g ""'
export FZF_DEFAULT_OPTS='--color=16'
