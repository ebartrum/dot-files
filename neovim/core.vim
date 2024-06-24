"Split panes
set splitbelow
nnoremap <silent> - :sp <CR>
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/persistence.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'zhou13/vim-easyescape'

call plug#end()

" Hybrid line numbers
set number relativenumber

nnoremap   <silent>   <C-t>   :FloatermNew<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermKill<CR>
tnoremap   <silent>   <C-c>   <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <C-o> <cmd>Telescope find_files<cr>

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
