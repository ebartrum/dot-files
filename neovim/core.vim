"Split panes
set splitbelow
nnoremap <silent> - :sp <CR>
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/persistence.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'zhou13/vim-easyescape'
Plug 'rebelot/kanagawa.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()

"vim-commentary shortcut (Ctrl /)
noremap <silent> <C-/> :Commentary<CR>
inoremap <silent> <C-/> <Esc>:Commentary<CR>A
noremap <silent> # :Commentary<CR>
noremap <silent> " :Commentary<CR>

" Hybrid line numbers
set number relativenumber

nnoremap   <silent>   <C-t>   :FloatermNew fish<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermKill<CR>
tnoremap   <silent>   <C-c>   <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <C-o> <cmd>Telescope find_files hidden=true no_ignore=true<cr>

" Disable esc in insert mode
imap <Esc> <NOP>

"Quick escape
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

"Easier pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Space in normal mode selects current word
nnoremap <space> viw
vnoremap <space> w

"clipboard sharing
set clipboard=unnamedplus

"clear search highlighting with ctrl c
nnoremap <nowait><silent> <C-C> :noh<CR>

command! OpenCoreCFG edit ~/.config/nvim/core.vim
command! ReloadCFG source $MYVIMRC

" colorscheme
set termguicolors
colorscheme kanagawa
