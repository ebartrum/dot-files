#!/bin/bash
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/nvim
mkdir -p ~/.config/i3status
mkdir -p ~/.config/i3

touch config-extra.fish
ln -is ~/Documents/repos/dot-files/config.fish ~/.config/fish/config.fish
ln -is ~/Documents/repos/dot-files/config-extra.fish ~/.config/fish/config-extra.fish
ln -is ~/Documents/repos/dot-files/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish
ln -is ~/Documents/repos/dot-files/init.vim ~/.config/nvim/init.vim
ln -is ~/Documents/repos/dot-files/i3-config ~/.config/i3/config
ln -is ~/Documents/repos/dot-files/i3status-config ~/.config/i3status/config
ln -is ~/Documents/repos/dot-files/.Xdefaults ~/.Xdefaults
