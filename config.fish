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
alias open "xdg-open"
alias vim "nvim"
git config --global core.editor "nvim"

source ~/.config/fish/config-extra.fish
