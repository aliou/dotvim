" A minimal vimrc for new vim users to start with.
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ===========================
" PATHOGEN

call pathogen#infect()
call pathogen#helptags()

" ===========================
" GENERAL CONFIG

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype indent plugin on

" Line number
set number

" Show incomplet command
set showcmd

" Reload files changed outside of vim
set autoread

" No swapfile
set noswapfile
set nobackup
set nowb

" Encoding
set encoding=utf-8

" ===========================
" INDENT

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" ===========================

set clipboard=unamed

