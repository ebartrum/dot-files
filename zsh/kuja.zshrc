# antigen
source $HOME/packages/antigen.zsh
antigen bundle jeffreytse/zsh-vi-mode
antigen apply

#zsh abbreviations
source $HOME/.zsh_plugins/zsh-abbr/zsh-abbr.zsh

#Shared config across machines
source $HOME/.zsh_core_rc

# # FZF keybindings
# [ -f ~/.fzf.zsh ]

# Append a command directly
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh') && source ~/.fzf.zsh

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
