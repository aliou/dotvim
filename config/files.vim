if has('autocmd')
  filetype plugin indent on
endif

" If the buffer has been changed outside of vim, quietly update it.
set autoread

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

" Go to file under cursor, create it if it doesn't exist.
" Two maps to handle HERP DERP's from my fingers.
" TODO: At some point simply remap `gf`?
nnoremap <silent> Gf :e <cfile><cr>
nnoremap <silent> gF :e <cfile><cr>

augroup cstm.files
  autocmd!

  " Auto save when leaving insert mode.
  autocmd InsertLeave * silent! wa
augroup END
