" vimrc for Markdown editing.
" Author: Aliou Diallo <code@aliou.me>

set nocompatible

" Plugins {{{
call plug#begin('~/.vim/md/bundle')

Plug 'aliou/moriarty.vim', { 'branch': 'fenced.vim' }
Plug 'bling/vim-airline'
Plug 'jacoborus/tender'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline-themes'

Plug '~/code/src/github.com/aliou/markoff.vim', { 'for': 'markdown' }

call plug#end()
" }}}

" Init {{{
set number
set relativenumber
" }}}

" color fenced
color tender

" Airline {{{
let g:airline_theme='lucius'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#hunks#enabled = 0
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
" }}}

" Autocmds {{{
augroup markdown
  autocmd!
  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell tw=0
augroup END
" }}}

" Markdown {{{
let g:markdown_fenced_languages =
      \ ['css', 'erb=eruby', 'javascript', 'js=javascript',
      \ 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'go']
" }}}

" TODO: Command preview: Open in Markoff if available.

set cc=+1
set textwidth=80
