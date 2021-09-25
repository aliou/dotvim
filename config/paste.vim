augroup cstm.paste
  autocmd!

  " Disable paste mode when leaving insert mode.
  autocmd InsertLeave * set nopaste
augroup END

" At some point, neovim's default introduce a Y mapping, which makes more sense
" compared to D but trips my muscle memory. So let's just unmap it here.
silent! unmap Y

augroup cstm.yank
    autocmd!

    " Highlight yanked text for 1 second.
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({ on_macro = true, timeout = 1000 })
augroup END
