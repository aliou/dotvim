" vimrc
" Author: Aliou Diallo <aliou.diallo@me.com>
" Source: https://github.com/aliou/dotvim/blob/master/vimrc

" Init -------------------------------------------------------------------- {{{
set nocompatible

"   Vundle --------------------------------------------- {{{
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'majutsushi/tagbar'
Bundle 'chrisbra/NrrwRgn'
Bundle 'sjl/clam.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Rip-Rip/clang_complete'

" }}}

Bundle 'holokai'
Bundle 'sjl/badwolf'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'

syntax on
filetype indent plugin on

" }}}

" Basic options ----------------------------------------------------------- {{{

set number
set showcmd
set autoread
set encoding=utf-8
set clipboard=unnamed
set shell=/bin/bash
" }}}

" Indent and tabs --------------------------------------------------------- {{{
set autoindent
set smartindent
set shiftwidth=2

" Insert blanks according to shiftwidth when <Tab> in front of a line. 
" set smarttab

" Number of spaces that a <Tab> counts for while performing editing operations.
" set softtabstop=2

" Number of spaces that a <Tab> in the file counts for.
" set tabstop=2

" Use the appropriate number of spaces to insert a <Tab>.
" set expandtab

" }}}
