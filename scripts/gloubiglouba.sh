#!/bin/bash

curl -sS https://starship.rs/install.sh | sh
starship init fish | source


curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher


sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user --break-system-packages
