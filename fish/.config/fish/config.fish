
# Remove fish default greeting
set fish_greeting
#so our brew install override the commands from the system
set -x PATH /usr/local/sbin $PATH

# Set locale
set -gx LC_ALL en_GB.UTF-8
set -gx LANG en_GB.UTF-8

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SHELL /usr/bin/fish

set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_user yes
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path yes
set -g theme_color_scheme solarized

set -gx NPM_REGISTRY_SERVER https://nexus.internal.steeple.com/repository/npm-global-registry
set -gx NPM_PUBLISH_REGISTRY https://nexus.internal.steeple.com/repository/steeple
set -gx NPM_AUTH_TOKEN NpmToken.5a6cc8db-9a8d-31ed-a635-7e6532f0929b

. ~/.config/fish/alias.fish

source ~/.config/fish/steeple.fish
source ~/.config/fish/alias.k8s.fish
if [ -f $HOME/.config/fish/alias.fish ]
    source $HOME/.config/fish/alias.fish
end

for f in ~/.config/fish/functions/*.fish
    source $f
end

# GoLang / Help: $ go help gopath
set -x GOPATH $WORKSPACE/go
# So we can run go commands and go programs we have compiled ourselves
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -gx PATH $HOME/.cargo/bin $PATH
# RVM
rvm default


direnv hook fish | source

starship init fish | source
