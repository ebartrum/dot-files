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
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}$(hostname) %{$fg[green]%}%~ %{$reset_color%}% "

#Environment Variables
export EDITOR='nvim'
export PATH="/home/ed/.local/bin:$PATH"

#SSH keychain
eval $(keychain --eval --quiet id_ed25519)

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/ed/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/ed/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
