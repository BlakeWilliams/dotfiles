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

ghci() {
  CHECK_OUTPUT="$(gh pr checks --json completedAt,link,name,startedAt,state,workflow)"
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to fetch GitHub PR checks." >&2
    return 1
  fi

  printf "%s\n" $CHECK_OUTPUT \
    | jq -r '.[] | [(.completedAt | fromdateiso8601), .state, .workflow, .name, .link] | @tsv' \
    | sort -r \
    | awk -F '\t' -v now="$(date +%s)" '
      function rel_time(ts,    diff) {
        if (ts < 0) return ""
        diff = now - ts

        if (diff < 60) return diff "s ago"
        if (diff < 3600) return int(diff / 60) "m ago"
        if (diff < 86400) return int(diff / 3600) "h ago"

        return int(diff / 86400) "d ago"
      }

      {
        completed=$1
        state=$2
        workflow=$3
        name=$4
        link=$5

        color="\033[90m"
        icon="?"
        if (state=="SUCCESS") {
          color="\033[32m"
          icon="✔"
        } else if (state=="FAILURE") {
          color="\033[31m"
          icon="✖"
        } else if (state=="PENDING" || state=="QUEUED" || state=="IN_PROGRESS") {
          color="\033[33m"
          icon="…"
        }

        if (workflow != "")
          workflow = workflow " - "

        printf "%s%s %s\033[0m  %s%s  %s\t%s\n",
          color, icon, state,
          workflow,
          name,
          rel_time(completed),
          link
      }
    ' \
    | fzf --ansi \
        --reverse \
        --delimiter="\t" \
        --with-nth=1 \
        --accept-nth=2 \
        --bind 'enter:execute-silent(open {2} >/dev/null 2>&1)+accept'
}
