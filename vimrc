" vimrc
" Author: Aliou Diallo <aliou.diallo@me.com>
" Source: https://github.com/aliou/dotvim/blob/master/vimrc

" Init -------------------------------------------------------------------- {{{

set nocompatible
filetype off

" }}}

"   Vundle --------------------------------------------- {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'sjl/clam.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-powerline'

" Colors
Bundle 'holokai'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'

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
set tabstop=8

" Use the appropriate number of spaces to insert a <Tab>.
" set expandtab

" }}}

" GUI -------------------------------------------------------------------- {{{

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
set t_Co=256
set background=dark
colorscheme molokai
set laststatus=2
set ch=3
set showmatch
set mat=5
set vb t_vb=
set ruler
set showcmd
set nolazyredraw
set scrolloff=5
set textwidth=80
set colorcolumn=+1

if has("gui")
  set go-=m
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R
endif

" }}}

" autocmd ----------------------------------------------------------------- {{{

  " Files ------------------------------------------------------------- {{{
  " makefiles do not like spaces.
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab 

  " These are Ruby files.
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} 
        \ set ft=ruby

  " These are markdown files.
  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell

  autocmd filetype gitcommit setlocal textwidth=72

  autocmd filetype css inoremap { <space>{<CR>}<esc>O
  " }}}
  " Interface --------------------------------------------------------- {{{
  " Restore cursor position.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Save on loss of focus when using a GUI.
  if has("gui")
    autocmd FocusLost * silent! wa
  endif

  " Resize splits when window is resized.
  autocmd VimResized * :wincmd =


  " Restore foldings.
  " autocmd BufWinLeave * silent! mkview
  " autocmd BufWinEnter * silent! loadview
  " }}}
  " Folds -------------------------------------------------------------- {{{
  autocmd FileType c,cpp setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype less,css setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType html setlocal foldmethod=manual
  autocmd FileType ruby setlocal foldmethod=syntax
  " }}}

" }}}

" Undo / Backups ---------------------------------------------------------- {{{

set undofile
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=

" }}}
