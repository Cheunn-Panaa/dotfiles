eval (thefuck --alias | tr '\n' ';')
# Vscode context
function changeCodeContext
  cd $1 &&
    code $1 -r
end

function changeMineContext
  cd $1 &&
    rubymine $1 -r 
end

# Pre-commit Alias
alias pcommit-sample='ln -s ~/.config/pre-commit/basic.yaml .pre-commit-config.yaml'

# Docker Alias

# Clean all stoped docker container
# alias dcc="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
# Clean all none docker images
# alias dci="docker images | grep '<none>' | sed -e's/  */ /g' |  cut -d ' ' -f 3 | xargs docker rmi"

alias dci='docker rmi (docker images -a -q)'
alias dcc='docker rm (docker ps -a -q)'
alias dsc='docker stop (docker ps -a -q)'
alias dlint='hadolint'
alias db-ip='docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}" steeplelocal-obelix-postgres-1'

# Steeple Aliases
alias steeple='cd /var/opt/steeple'
alias steeple-lcl='cd /var/opt/steeple/steeple.local'
alias bonemine='changeCodeContext /var/opt/steeple/steeple.local/bonemine'
alias obelix='changeCodeContext /var/opt/steeple/steeple.local/obelix'

alias webapp='steeple-lcl && docker-compose --profile web-app up -d'
alias bonemine-bash='steeple-lcl && docker-compose run --rm bonemine bash'
alias obelix-bash='steeple-lcl && docker-compose run --rm obelix bash'

alias git-clean='~/.config/scripts/git-clean.sh'
alias obelix-reset-db='./home/cheun-nourry/.config/scripts/reset-db.sh docker'

alias git-churm='git log --format=oneline '