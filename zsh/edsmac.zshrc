# Your oh-my-zsh installation.
ZSH=/Users/ed/.oh-my-zsh
ZSH_THEME="fishy"

# Which plugins would you like to load? (found in $ZSH/plugins/)
plugins=(git zsh-abbr)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh

#Shared config across machines
source $HOME/.zsh_core_rc

# FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Prompt
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}$(hostname -s) %{$fg[green]%}%~ %{$reset_color%}% "

#Environment Variables
export EDITOR='nvim'


clear
