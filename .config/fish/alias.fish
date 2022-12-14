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


# Docker Alias
alias dci='docker rmi (docker images -a -q)'
alias dcc='docker rm (docker ps -a -q)'
alias dsc='docker stop (docker ps -a -q)'
alias dlint='hadolint'

# Steeple Aliases
alias steeple='cd /var/opt/steeple'
alias steeple-lcl='cd /var/opt/steeple/steeple.local'
alias bonemine='changeCodeContext /var/opt/steeple/steeple.local/bonemine'
alias obelix='changeCodeContext /var/opt/steeple/steeple.local/obelix'

alias webapp='steeple-lcl && docker-compose --profile web-app up -d'
alias bonemine-bash='steeple-lcl && docker-compose run --rm bonemine bash'
alias obelix-bash='steeple-lcl && docker-compose run --rm obelix bash'

alias git-clean='~/.config/scripts/git-clean.sh'
alias s-tmux='~/.config/fish/function/start-tmux.sh'