if has('autocmd')
 " Auto save when leaving insert mode.
 autocmd InsertLeave * silent! wa

 " Disalbe paste mode when leaving insert mode.
 autocmd InsertLeave * set nopaste

 " Auto resize panes.
 autocmd VimResized * execute "normal! \<c-w>="

 " Spell for commits.
 autocmd filetype gitcommit setlocal spell textwidth=72

 autocmd FileType help setlocal textwidth=0
endif
