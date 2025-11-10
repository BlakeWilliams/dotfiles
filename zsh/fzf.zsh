# Load fzf if it is installed and exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden -g ""'
export FZF_DEFAULT_OPTS='--color=16 --tmux center --bind up:preview-up,down:preview-down,ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'

# if bat is installed, we preview
if command -v bat &> /dev/null; then
  export FZF_CTRL_T_OPTS="--preview '
    if [ -d {} ]; then
      if command -v eza &>/dev/null; then
        eza --color=always -T {} | head -200
      elif command -v tree &>/dev/null; then
        tree -C {} | head -200
      else
        echo \"No preview available\"
      fi
    else
      bat --style=plain --paging=never --color=always -n {} 2>/dev/null || sed -n \"1,200p\" {}
    fi'"
fi

# if eza is installed, we preview
if command -v eza &> /dev/null; then
  export FZF_ALT_C_OPTS="--preview 'eza --color always -T {}'"
fi

export FZF_CTRL_R_OPTS="--preview 'echo {} | cut -f 2 | bat --color=always --plain --language=sh' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
