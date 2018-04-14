if has('autocmd')
  filetype plugin indent on
endif

if has('file_in_path')
  " Recursively add directories to the path. Helpful for `:find` and friends.
  set path+=**
endif

" If the buffer has been changed outside of vim, quietly update it.
set autoread

set autowriteall

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

" augroup cstm_files
"   autocmd!

"   " Auto save when leaving insert mode.
"   autocmd InsertLeave * silent! wa
" augroup END
