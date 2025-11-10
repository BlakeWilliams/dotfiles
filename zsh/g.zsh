g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}


typeset -g _fzf_orig_completion_g=_git

_fzf_complete_g() {
  ARGS="$@"

  if [[ $ARGS == "g co"* || $ARGS == "g checkout"* ]]; then
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { eval "zle $orig"; return; }

    local branches
    branches="$(
      git for-each-ref \
        --format='%(refname:short)' \
        refs/heads refs/remotes 2>/dev/null
    )"
    [[ -n $branches ]] || { eval "zle $orig"; return; }

    _fzf_complete --reverse --multi -- "$@" < <(printf '%s\n' "$branches")
    return
  fi

  eval "zle ${fzf_default_completion:-expand-or-complete}"
}

# optional: post filter to return just the branch name
_fzf_complete_g_post() {
  awk -F'\t' '{print $1}'  # Return only the branch name
}

compdef g=git
zstyle ':completion:*:*:g:*' command git
