" Minimal vimrc
" Author: Aliou Diallo <code@aliou.me>

set nocompatible

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'aliou/moriarty.vim'
Plug 'bling/vim-airline'

call plug#end()

color moriarty
let g:airline_theme='lucius'

echom "You might want to use neovim: run `nvim`."
