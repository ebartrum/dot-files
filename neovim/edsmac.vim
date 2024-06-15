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

call plug#end()

" Hybrid line numbers
set number relativenumber

" Setup indent-blankline
" require("ibl").setup()
"
nnoremap   <silent>   <C-t>   :FloatermNew<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermKill<CR>
tnoremap   <silent>   <C-c>   <C-\><C-n>:FloatermKill<CR>
