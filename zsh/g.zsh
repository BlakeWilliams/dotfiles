g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

compdef g=git
