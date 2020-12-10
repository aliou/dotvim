if has('autocmd')
  filetype plugin indent on
endif

" If the buffer has been changed outside of vim, quietly update it.
set autoread

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

" Go to file under cursor, create it if it doesn't exist.
nnoremap <silent> gf :e <cfile><cr>

augroup cstm.files
  autocmd!

  " Auto save when leaving insert mode.
  autocmd InsertLeave * silent! wa
augroup END
