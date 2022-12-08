
# Remove fish default greeting
set --erase fish_greeting
# so our brew install override the commands from the system
set -x PATH /usr/local/sbin $PATH

# Set locale
set -gx LC_ALL en_GB.UTF-8
set -gx LANG en_GB.UTF-8

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SHELL /usr/bin/bash

set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_user yes
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path yes
set -g theme_color_scheme solarized

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
. ~/.config/fish/alias.fish

# GoLang / Help: $ go help gopath
set -x GOPATH $WORKSPACE/go
# So we can run go commands and go programs we have compiled ourselves
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# RVM
rvm default


#source ~/.config/fish/tty_dracula.sh
if [ -f $HOME/.config/fish/alias.fish ]
    source $HOME/.config/fish/alias.fish
end


direnv hook fish | source

starship init fish | source
