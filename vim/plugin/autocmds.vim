if has('autocmd')
  " autocmd!

 " Auto save when leaving insert mode.
 autocmd InsertLeave * silent! wa

 " Disalbe paste mode when leaving insert mode.
 autocmd InsertLeave * set nopaste

 autocmd filetype gitcommit setlocal spell textwidth=72
 autocmd FileType help setlocal textwidth=0
endif