augroup cstm.paste
  autocmd!

  " Disable paste mode when leaving insert mode.
  autocmd InsertLeave * set nopaste
augroup END
