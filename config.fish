#setup Anaconda
# set -gx PATH /home/ed/anaconda3/bin $PATH
# source /home/ed/anaconda3/etc/fish/conf.d/conda.fish

# Remove fish greeting
set fish_greeting

# Set up Anaconda
# source /home/ebartrum/anaconda3/etc/fish/conf.d/conda.fish
# set PATH /home/ebartrum/anaconda3/bin $PATH

# CUDA 
# set PATH /usr/local/cuda-10.0/bin $PATH
# set CUDA_PATH /usr/local/cuda-10.0
# set CUDA_HOME /usr/local/cuda-10.0
# set LD_LIBRARY_PATH $CUDA_PATH/lib64 $LD_LIBRARY_PATH
# set LIBRARY_PATH /usr/local/cuda/lib64 $LIBRARY_PATH
# set CPATH /usr/local/cuda/include $CPATH 

# Misc
alias vim "nvim"
git config --global core.editor "nvim"

#Abbreviations
abbr --add gc git commit
abbr --add ga git add 
abbr --add gs git status 
abbr --add gd git diff 
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

  printf '%s' (prompt_hostname):
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

# Source machine specific config
source ~/.config/fish/config-extra.fish
