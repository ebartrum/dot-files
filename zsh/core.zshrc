# Navigation
bindkey '^k' up-line-or-search
bindkey -s '^[^o' '^ufile=$(fzf --height 40% --reverse); [[ ! -z "\$file" ]] && nvim $file^M'

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
