" vimrc
" Author: Aliou Diallo <aliou.diallo@me.com>
" Source: https://github.com/aliou/dotvim/blob/master/vimrc

" Init -------------------------------------------------------------------- {{{
set nocompatible

call pathogen#infect()
call pathogen#helptags()
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
