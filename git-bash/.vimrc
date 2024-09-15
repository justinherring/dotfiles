" remap esc to 'jk' 
inoremap jk <ESC>

" remap leader key to '
let mapleader="'"

set noswapfile

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set autoindent

" line number and line/char position
set number
set relativenumber
set ruler

" set incremental search and highlight search
set incsearch
set hlsearch
set ignorecase

syntax on " syntax highlighting

set shortmess="filnxtToO"

" enable dot command in normal mode
vnoremap . :norm.

