alias b="bundle"
alias be="bundle exec"

alias mkdir="mkdir -p"
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias drop="rake db:drop && rake db:create && rake db:migrate"

alias fucknode="rm -rf node_modules && rm -rf bower_components"
alias nodeplz="npm install && bower install"
alias omgnode="fucknode && nodeplz"
alias fuckingphantom="pkill -9 -f phantomjs"
