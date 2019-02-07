#!/bin/bash
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/nvim
ln -is ~/Documents/dot-files/.tmux.conf ~/.tmux.conf
ln -is ~/Documents/dot-files/config.fish ~/.config/fish/config.fish
ln -is ~/Documents/dot-files/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish
ln -is ~/Documents/dot-files/init.vim ~/.config/nvim/init.vim
