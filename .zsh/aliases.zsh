alias zr="source ~/.zshrc"

alias b="bundle"
alias be="bundle exec"

alias mkdir="mkdir -p"
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias drop="rake db:drop && rake db:create && rake db:migrate"

alias nodeplz="npm cache clean && bower cache clean && npm install && bower install"
alias fucknode="rm -rf node_modules && rm -rf bower_components"
alias omgnode="fucknode && nodeplz"
alias fuckingphantom="pkill -9 -f phantomjs"
