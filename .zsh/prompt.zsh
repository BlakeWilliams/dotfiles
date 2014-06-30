_red() { echo "%{$fg[red]%}" }
_yellow() { echo "%{$fg[yellow]%}" }
_green() { echo "%{$fg[green]%}" }
_reset() { echo "%{$reset_color%}" }

_git_branch() {
  git_toplevel=$(git rev-parse --show-toplevel)

  if [[ $git_toplevel != $HOME || $(pwd) == $HOME ]]; then
    if [[ -d ${git_toplevel}"/.git/safe" ]]; then
      color=$(_green)
    else
      color=$(_yellow)
    fi
    print " on $color$(git rev-parse --abbrev-ref HEAD)$(_reset)"
  fi
}

RPROMPT='%1~$(_git_branch)'
PROMPT='%(?.$(_yellow).$(_red))λ%{$reset_color%} '
