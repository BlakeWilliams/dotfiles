alias zr="source ~/.zshrc"

alias b="bundle"
alias be="bundle exec"

alias mkdir="mkdir -p"
alias migrate="bundle exec rake db:migrate db:rollback && bundle exec rake db:migrate"
alias drop="rake db:drop && rake db:create && rake db:migrate"

alias nodeplz="npm cache clear && npm install"
alias fucknode="rm -rf node_modules"
alias omgnode="fucknode && nodeplz"
alias nbin='PATH=$(npm bin):$PATH nocorrect'

alias r="echo not this time"
alias fucking="pkill -9 -f"

alias dc="docker-compose"
alias dm="docker-machine"

export EDITOR=nvim
export VISUAL=nvim

alias vim=nvim

alias 💸="git money"
alias yolo="git push --force"
