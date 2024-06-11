set nocompatible
filetype off
set encoding=utf-8
" Set no highlight search
set nohlsearch

" Disable esc in insert mode
imap <Esc> <NOP>

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rakr/Vim-one'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'dag/vim-fish'
Plug 'zhou13/vim-easyescape'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'danilamihailov/beacon.nvim'
Plug 'vimwiki/vimwiki'
call plug#end()

"vim-commentary shortcut (Ctrl /)
noremap <silent> <C-/> :Commentary<CR>
inoremap <silent> <C-/> <Esc>:Commentary<CR>A

"Hybrid line numbers
set relativenumber
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=None gui=NONE guifg=#505050 guibg=Grey5
autocmd VimEnter * hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=DarkOrange

"Theme options
set background=dark
let g:airline_theme = 'one'

"Press (shift) enter in command mode to insert a new-line after (before) the current line
nmap <S-CR> O<C-c>
nmap <CR> o<C-c>k

"Open files using fzf
noremap <silent> <C-M-o> :FZF<CR>

"clipboard sharing
set clipboard=unnamedplus

" Set tab to 4 spaces
set tabstop=4 shiftwidth=4 expandtab

"Easier pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"PageUp and PageDown shortcuts
nnoremap J <PageDown> H
nnoremap K <PageUp> H

"Space in normal mode selects current word
nnoremap <space> viw
vnoremap <space> w

"Eliminate escape key lag
set timeoutlen=10 ttimeoutlen=0

"Split panes
set splitbelow
nnoremap <silent> - :sp <CR>

"Make backspace work as expected in insert mode
set backspace=indent,eol,start

" Highlight line lengths over 79
highlight ColorColumn ctermbg=DarkCyan
call matchadd('ColorColumn', '\%81v', 100)

"Quick escape
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

" " Ctrl j and k to navigate menus
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"Beacon
highlight Beacon guibg=gray ctermbg=15

"FloatTerm
nnoremap <silent> <C-t>   :FloatermToggle<CR>
tnoremap <silent> <C-t>   <C-\><C-n>:FloatermToggle<CR>
