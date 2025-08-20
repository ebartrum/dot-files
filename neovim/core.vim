source ~/.config/nvim/vimplug.vim

"Split panes
set splitbelow
nnoremap <silent> - :sp <CR>

"markdown preview options
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
noremap <silent> <C-m> :MarkdownPreviewToggle<CR>

"vim-commentary shortcut (Ctrl /) - for now this only works in tmux.
noremap <silent>  :Commentary<CR>
inoremap <silent>   <Esc>:Commentary<CR>A

" The no-tmux version is below:
" noremap <silent> <C-/> :Commentary<CR>
" inoremap <silent> <C-/> <Esc>:Commentary<CR>A

noremap <silent> # :Commentary<CR>
noremap <silent> " :Commentary<CR>

" Hybrid line numbers
set number relativenumber

"Floatterm
nnoremap   <silent>   <C-t>   :FloatermNew fish<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermKill<CR>
tnoremap   <silent>   <C-c>   <C-\><C-n>:FloatermKill<CR>
let g:floaterm_width = 0.9

"telescope options

lua << EOF
require('telescope').setup{
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--color", "never", "--no-require-git" }
    }
  }
}
EOF

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

"clipboard sharing
set clipboard=unnamedplus

"clear search highlighting with ctrl c
nnoremap <nowait><silent> <C-C> :noh<CR>

command! OpenCoreCFG edit ~/.config/nvim/core.vim
command! ReloadCFG source $MYVIMRC

" colorscheme
set termguicolors
colorscheme kanagawa

"Beacon
highlight Beacon guibg=gray ctermbg=15

"Turn off mouse
set mouse=
