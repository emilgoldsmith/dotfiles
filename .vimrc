" Disable Vi settings
set nocompatible

" Add line numbers
set number

" Make tabs equal 2 spaces
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2

" Enable syntax highlighting
syntax enable

" Enable recognition of indent and plugin files based on filetype
filetype plugin indent on

" Use monokai color scheme
colorscheme monokai

" Delete trailing whitespace at end of each line on save
autocmd BufWritePre * %s/\s\+$//e

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Case insensitive search
set ignorecase

" Forces slower, safer copy + overwrite backing up which also triggers
" Webpack correctly.
" For this issue also remember this:
" https://webpack.github.io/docs/troubleshooting.html#not-enough-watchers
set backupcopy=yes

" Pathogen plugin installer stuff
execute pathogen#infect()

" Enable JSX highlighting on JS files
let g:jsx_ext_required = 0

" I have installed Pathogen from https://github.com/tpope/vim-pathogen

" Installed plugins:
"  - git@github.com:hail2u/vim-css3-syntax.git
"  - https://github.com/mxw/vim-jsx
"  - https://github.com/ervandew/supertab
"  - https://github.com/fremff/vim-css-syntax
"  - https://github.com/styled-components/styled-components
"  - https://github.com/nvie/vim-flake8
"  - https://github.com/rschmukler/pangloss-vim-indent
"  - https://github.com/othree/es.next.syntax.vim

" Installed colorschemes
"  - https://github.com/sickill/vim-monokai
