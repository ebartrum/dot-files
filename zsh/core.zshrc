# Navigation
bindkey '^k' up-line-or-search
bindkey -s '^[^o' '^ufile=$(fzf --height 40% --reverse); [[ ! -z "\$file" ]] && nvim $file^M'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Abbreviations
abbr add --quiet gch='git checkout'
abbr add --quiet gchb='git checkout -b'
abbr add --quiet gchp='git checkout -p'
abbr add --quiet gcm='git commit -m'
abbr add --quiet gca='git commit --amend'
abbr add --quiet gs='git status'
abbr add --quiet gstsh='git stash'
abbr add --quiet gd='git diff'
abbr add --quiet gl='git log'
abbr add --quiet gla='git log --all'
abbr add --quiet ga='git add'
abbr add --quiet gap='git add -p'
abbr add --quiet gb='git branch'
abbr add --quiet gbd='git branch -d'
abbr add --quiet op='xdg-open'
abbr add -f -qq vim='nvim'
abbr add --quiet mamba='micromamba'

# History configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
