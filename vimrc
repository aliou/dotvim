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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-startify'
Plug 'sjl/badwolf'
Plug 'wombat256.vim'

" Settings
Plug 'dietsche/vim-lastplace'
Plug 'tpope/vim-sensible'

" Shell
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
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Projects
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['<plug>(ctrlp)', 'CtrlPMRUFiles', 'CtrlPBuffer' ]}
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'

" Languages
Plug 'chr4/nginx.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'

" Text object.
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'gilligan/textobj-gitgutter'
Plug 'PeterRincker/vim-argumentative'

" Tests / Lint
Plug 'janko-m/vim-test'
Plug 'junegunn/vader.vim'
Plug 'w0rp/ale'

" Local
Plug '~/code/src/github.com/aliou/bats.vim'
Plug '~/code/src/github.com/aliou/cargo.vim'
Plug '~/code/src/github.com/aliou/dope.vim'
Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/irssi.vim'
Plug '~/code/src/github.com/aliou/jekyll.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/mix.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/phx.vim'
Plug '~/code/src/github.com/aliou/review.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/spec-index.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'
Plug '~/code/src/github.com/aliou/untitled.vim'
Plug '~/code/src/github.com/aliou/vim-dispatch-terminal'
Plug '~/code/src/github.com/aliou/wren.vim'

call plug#end()
" }}}
