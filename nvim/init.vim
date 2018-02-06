set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Disable neovim default of changing cursor in insert mode
set guicursor=

" Set exit terminal focus to CTRL+F
tnoremap <c-f> <c-\><c-n>
