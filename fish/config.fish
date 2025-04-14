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
abbr --add gs git status

#key-bindings
bind \co forward-word
bind \ck up-or-search
bind \cp accept-autosuggestion

#Environment variables
set -gx EDITOR nvim
