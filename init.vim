set nocompatible
filetype off
set encoding=utf-8
" Set no highlight search
set nohlsearch

" Disable esc in insert mode 
imap <Esc> <NOP>

" Paste over text without changing register contents
" xnoremap p "_dp

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rakr/Vim-one'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'dag/vim-fish'
Plug 'tdehaeze/matlab-vim'
Plug 'zhou13/vim-easyescape'
Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
call plug#end()

"vim-commentary shortcut (Ctrl /)
noremap <silent> <C-_> :Commentary<CR>
inoremap <silent> <C-_> <Esc>:Commentary<CR>A
" TODO: Start comment on empty line in insert mode.
" inoremap <silent> <C-_>; getline(line(".")) =~ "^$" ? "test" : ""

" Switch to POSIX compliant shell when using fish
if &shell =~# 'fish$'
    set shell=sh
endif

"Hybrid line numbers
set relativenumber
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=None gui=NONE guifg=#505050 guibg=Grey5
autocmd VimEnter * hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=DarkOrange

"Theme options
set background=dark
let g:airline_theme = 'one'
set termguicolors

"Press (shift) enter in command mode to insert a new-line after (before) the current line
nmap <S-CR> O<C-c>
nmap <CR> o<C-c>k

"Open files using fzf
nnoremap <silent> <expr> <C-o> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

"clipboard sharing
set clipboard=unnamedplus

" Set tab to 4 spaces
set tabstop=4 shiftwidth=4 expandtab

"Easier pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

function RunUnitTests()
    let file_name = expand('%:t')
    let startswith = split(file_name, "_")[0]
    if startswith == "test"
        let unit_test_file_name = file_name
    else
        let unit_test_file_name = 'test_'.file_name
    endif
    let test_directory = expand('%:p:h')
    " execute "!cd ".test_directory."; green -vvv ".unit_test_file_name."; cd -"
    execute "!cd ".test_directory."; py.test ".unit_test_file_name."; cd -"
endfunction

function OpenURLInBrowser()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!sensible-browser '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction

command FollowLink call OpenURLInBrowser()

"PageUp and PageDown shortcuts
nnoremap J <PageDown> H
nnoremap K <PageUp> H

"Save and run script shortcut
command Run !echo "Running %...";python %
autocmd FileType r map <buffer> <F5> :!clear;echo "Running %...";RScript %<cr>
autocmd FileType c map <buffer> <F5> :!clear;echo "Compiling %...";gcc % -o %:r;echo "Running %:r...";./%:r<cr>

"Run unit tests shortcut
command Test call RunUnitTests()

"Reload vimrc after it is saved
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"Space in normal mode selects current word
nnoremap <space> viw
vnoremap <space> w

"Eliminate escape key lag
set timeoutlen=10 ttimeoutlen=0

"Split panes
set splitbelow
nnoremap <silent> - :sp <CR>

command SourceVimrc <silent> source $MYVIMRC

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

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Ctrl j and k to navigate menus
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"Status line
let g:airline_theme='bubblegum'
set noshowmode

"Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
