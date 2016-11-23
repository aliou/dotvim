" vimrc
" Author: Aliou Diallo <code@aliou.me>

" Basic options {{{
syntax on
filetype indent plugin on
set nocompatible
" }}}


" Plugins"{{{
call plug#begin('~/.vim/bundle')

Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/spec-index.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'

call plug#end()
" }}}

set bg=dark
color moriarty
