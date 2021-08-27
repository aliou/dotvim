augroup cstm.paste
  autocmd!

  " Disable paste mode when leaving insert mode.
  autocmd InsertLeave * set nopaste
augroup END

" At some point, neovim's default introduce a Y mapping, which makes more sense
" compared to D but trips my muscle memory. So let's just unmap it here.
silent! unmap Y
