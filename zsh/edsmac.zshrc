#zsh abbreviations
source $HOME/.zsh_plugins/zsh-abbr/zsh-abbr.zsh

#Shared config across machines
source $HOME/.zsh_core_rc

# FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Prompt
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}$(hostname -s) %{$fg[green]%}%~ %{$reset_color%}% "

#Environment Variables
export EDITOR='nvim'

#antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load $HOME/.zsh_plugins.txt
