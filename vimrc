" vimrc
" Author: Aliou Diallo <code@aliou.me>

" set nocompatible

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
filetype indent plugin on
syntax on

let mapleader = ","

" Plugins {{{
call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'dietsche/vim-lastplace'
Plug 'fatih/vim-go'
Plug 'mhinz/vim-startify'
Plug 'sjl/clam.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'chriskempson/base16-vim'
Plug 'godlygeek/csapprox'
Plug 'wombat256.vim'

Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/spec-index.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'

call plug#end()
" }}}
