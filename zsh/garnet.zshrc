# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fishy"

# Which plugins would you like to load? (found in $ZSH/plugins/)
plugins=(git zsh-abbr)

source $ZSH/oh-my-zsh.sh

#Environment Variables
export EDITOR='nvim'
export PATH="/home/ed/.local/bin:$PATH"

#Shared config across machines
source $HOME/.zsh_core_rc

# FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Prompt
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}% "

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

#SSH keychain
eval $(keychain --eval --quiet id_ed25519)

# append
path+=('/opt/cuda/bin')
export PATH
