alias r="echo not this time"
alias fucking="pkill -9 -f"

alias dc="docker-compose"
alias dm="docker-machine"

alias vim=nvim

alias rg="rg --ignore-file ~/.ignore"
alias be="bundle exec"

if [[ -n "$TMUX" ]] then
  alias clear="clear && tmux clear-history"
fi

alias popup="tmux popup -E -w 60% -h 60%"

alias nethackbreak="tmux popup -E -w 60% -h 60% nethack"
alias slashembreak="tmux popup -E -w 60% -h 60% slashem"
alias migration="date '+%Y%m%d%H%M%S'"

gocoverstats() {
    local t=$(mktemp -t cover)
    go test $COVERFLAGS -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}

gocover() {
    local t=$(mktemp -t cover)
    go test -coverprofile=$t $@ \
        && go tool cover -html=$t \
        && unlink $t
}

if command -v eza > /dev/null 2>&1; then
  alias ls="eza"
fi
