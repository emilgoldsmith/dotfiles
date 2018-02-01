set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Disable neovim default of changing cursor in insert mode
set guicursor=

" Enable deoplete
let g:deoplete#enable_at_startup = 1
