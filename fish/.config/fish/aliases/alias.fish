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

alias config='nvim ~/dotfiles' 

# Docker Alias

# Clean all stoped docker container
# alias dcc="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
# Clean all none docker images
# alias dci="docker images | grep '<none>' | sed -e's/  */ /g' |  cut -d ' ' -f 3 | xargs docker rmi"

alias dci='docker rmi (docker images -a -q)'
alias dcc='docker rm (docker ps -a -q)'
alias dsc='docker stop (docker ps -a -q)'
alias dlint='hadolint'
alias git-clean='~/.config/scripts/git-clean.sh'
alias git-churm='git log --format=oneline '
