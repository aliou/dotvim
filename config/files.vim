filetype plugin indent on

" If the buffer has been changed outside of vim, quietly update it.
set autoread

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

augroup cstm.files
  autocmd!

  " Auto save when leaving insert mode.
  autocmd InsertLeave * silent! wa
augroup END
