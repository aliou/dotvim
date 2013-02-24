" gvimrc
" Author: Aliou Diallo <aliou.diallo@me.com>
" Source: https://github.com/aliou/dotvim/blob/master/gvimrc

" gvim ------------------------------------------------------------------- {{{ 
    set go-=m
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
" }}}

" autocmd ---------------------------------------------------------------- {{{
    autocmd FocusLost * silent! wa
" }}}
