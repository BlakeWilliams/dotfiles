# Add binstubs to path
export PATH=".git/safe/../../bin:$PATH"

# Load autocomplete
autoload -U compinit
compinit

# Load completion functions
fpath=(/usr/local/share/zsh/site-functions $fpath)

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Load Colors
autoload -U colors
colors
export CLICOLOR=1

# Show ls on dark backgrounds well
unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS=$LSCOLORS

# Disable weird piping behavior
unsetopt multios

# Notify before prompt instead of directly on exit
unsetopt notify

# Grep gets colors too
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;32'

# Partial match highlighting
zstyle -e ':completion:*:default' list-colors \
  'reply=("${PREFIX:+=(#bi)($PREFIX:t)()*==34=34}:${(s.:.)LS_COLORS}")'

setopt append_history         # Append, not replace
setopt inc_append_history     # Immediately append history
setopt always_to_end          # Always go to end of line on complete
setopt correct                # Correct typos
setopt hist_ignore_dups       # Do not show dupes in history
setopt hist_ignore_space      # Ignore commands starting with space
setopt prompt_subst           # Necessary for pretty prompts

# HISTORY!
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# Disable history expansion
# This allows usage of ! without escaping, eg: `git commit -m "yes!"`
unsetopt BANG_HIST

# Vim like history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Use vi keybindings
bindkey -v

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "$key[Up]" up-line-or-beginning-search # Up
bindkey "$key[Down]" down-line-or-beginning-search # Down

# Allow backspace after vi mode
bindkey '^?' backward-delete-char

# Beginning and End line shortcuts
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line

# Reset pane names in tmux to "" instead of "hostname"
if [[ -n "$TMUX" ]]; then
  echo -ne "\033]2;\033\\"
fi

# Load all files in ~/.zsh
for function in ~/.zsh/*.zsh; do
  source $function
done

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Report basic title
function precmd {
  local escaped_home=$(echo $HOME | sed -e 's|/|\\/|'g)
  local title=$(pwd | sed "s/^$escaped_home/~/")
  print -Pn "\e]0;$title\a"
}

# Export editor preference
export EDITOR=nvim
export VISUAL=nvim

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  export EDITOR=vim
  export VISUAL="code --wait"
fi
