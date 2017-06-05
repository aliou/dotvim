" vimrc
" Author: Aliou Diallo <code@aliou.me>

set nocompatible

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
filetype indent plugin on
syntax on

let mapleader = ","

" Plugins {{{
call plug#begin('~/.vim/bundle')

" Display
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'
Plug 'reedes/vim-colors-pencil'
Plug 'sjl/badwolf'
Plug 'wombat256.vim'
Plug 'AlessandroYorba/Sierra'

" Settings
Plug 'dietsche/vim-lastplace'
Plug 'tpope/vim-sensible'

" Shell
Plug 'sjl/clam.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Utils.
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'

" Projects
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-projectionist'
Plug 'aliou/vim-projectionist', { 'branch': 'ad-ignore-empty-completions' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'startify'] }
Plug 'tpope/vim-rake', { 'for': ['ruby', 'startify'] }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-scriptease'

" Languages
Plug 'chr4/nginx.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" TODO: Remove this? Benchmark loading because of this plugin.
" Plug 'sheerun/vim-polyglot'

" Text object.
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'PeterRincker/vim-argumentative'

" Tests / Lint
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" Local
Plug '~/code/src/github.com/aliou/bats.vim'
Plug '~/code/src/github.com/aliou/dope.vim'
Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/jekyll.vim'
Plug '~/code/src/github.com/aliou/phx.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/spec-index.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'
Plug '~/code/src/github.com/aliou/untitled.vim'

call plug#end()
" }}}
