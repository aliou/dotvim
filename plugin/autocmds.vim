if has('autocmd')
 " Auto save when leaving insert mode.
 autocmd InsertLeave * silent! wa

 " Disalbe paste mode when leaving insert mode.
 autocmd InsertLeave * set nopaste

 " Auto resize panes.
 autocmd VimResized * execute "normal! \<c-w>="

 " Spell for commits.
 autocmd FileType gitcommit setlocal spell textwidth=72

 " Spell for markdown
 autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
 autocmd FileType markdown setlocal spell textwidth=80

 autocmd FileType help setlocal textwidth=0
endif
