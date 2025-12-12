#Remove greeting
set -g fish_greeting

#Abbreviations
abbr --add gch git checkout
abbr --add gchb git checkout -b
abbr --add gchp git checkout -p
abbr --add gcm git commit -m
abbr --add gca git commit --amend
abbr --add gstsh git stash
abbr --add gd git diff
abbr --add gl git log
abbr --add gla git log --all
abbr --add ga git add
abbr --add gap git add -p
abbr --add gb git branch
abbr --add gbd git branch -d
abbr --add gpsu git push --set-upstream origin '(git symbolic-ref --short HEAD)'
abbr --add gs git status
abbr --add gcf git clean -f
abbr --add vim nvim

#key-bindings
bind \co forward-word
bind \ck up-or-search
bind \cp accept-autosuggestion
bind alt-o 'nvim -c ":Telescope find_files"'

#Environment variables
set -gx EDITOR nvim

#prompt
function fish_right_prompt -d "Write out the right prompt"
    echo (set_color yellow) $STY (set_color normal)
end

# ssh-agent
if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

#setup zoxide
zoxide init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

