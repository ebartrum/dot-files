# Your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
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
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}% "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Environment Variables
export EDITOR='nvim'

#SSH keychain
eval $(keychain --eval --quiet id_ed25519)