t() {
    if [[ $# -gt 0 ]]; then
        tmux "$@"
        return
    fi

    if [[ -n "$TMUX" ]]; then
        tmux ls
        return
    fi

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        session_name="${PWD##*/}"
        if ! tmux has-session -t "$session_name" 2>/dev/null; then
            tmux new-session -s "$session_name"
        else
            tmux attach -t "$session_name"
        fi
    else
        echo "Not starting tmux session, not in git repository."
    fi
}

compdef t=tmux
