# Remove fish greeting
set fish_greeting

# Misc
alias vim "nvim"
alias vi "nvim"
git config --global core.editor "nvim"
set -U EDITOR "nvim"
set -U VISUAL "nvim"

#Abbreviations
abbr --add gc git commit
abbr --add gcm git commit -m
abbr --add ga git add 
abbr --add gs git status 
abbr --add gd git diff 
abbr --add gl git log 
abbr --add gla git log --all
abbr --add gap git add -p
abbr --add gch git checkout
abbr --add gchp git checkout -p
abbr --add gchb git checkout -b
abbr --add gb git branch 
abbr --add gbd git branch -d
abbr --add op xdg-open

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
  set last_status $status

  printf '%s' (prompt_hostname)
  set_color bryellow
  printf '%s ' (echo $STY)
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s ' (__fish_git_prompt)
end

function search_and_edit
  set filename (fzf --height 20 --reverse)
  if string length -q $filename
      nvim $filename
  end
  commandline -f repaint
end

# Source machine specific config
source ~/.config/fish/config-extra.fish

# FZF command
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
