" A minimal vimrc for new vim users to start with.
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
call pathogen#helptags()

" Switch syntax highlighting on.
syntax on

" Enable file type detection and do language-dependent indenting.
filetype indent plugin on

" Line number.
set number

" Show incomplet command.
set showcmd

" Reload files changed outside of vim.
set autoread

" No swapfile nor backups.
set noswapfile
set nobackup
set nowb

" Encoding.
set encoding=utf-8

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Insert blanks according to shiftwidth when <Tab> in front of a line. 
set smarttab

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Number of spaces that a <Tab> counts for while performing editing
" operations.
set softtabstop=2

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Yank to OS clipboard.
set clipboard="unnamed"

