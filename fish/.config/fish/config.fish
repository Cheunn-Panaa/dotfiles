
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

## Aliases
for f in ~/.config/fish/aliases/*.fish
    source $f
end


## Functions
for f in ~/.config/fish/functions/*.fish
    source $f
end

## Scripts  
for f in ~/.config/fish/scripts/*.fish
    source $f
end

## Current company fish config
if test -d $HOME/.config/steeple/fish
    for f in $HOME/.config/steeple/fish/*.fish
        source  $f
    end
end
## END Current company fish config

# GoLang / Help: $ go help gopath
set -x GOPATH $WORKSPACE/go
# So we can run go commands and go programs we have compiled ourselves
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -gx PATH $HOME/.cargo/bin $PATH
# RVM
#rvm default


direnv hook fish | source

starship init fish | source
