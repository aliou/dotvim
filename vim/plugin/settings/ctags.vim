" Recreate a tags file every time a c, cpp or h file is saved.
au BufWritePost *.c,*.cpp,*.h,*.hh,*.hpp silent! !ctags -R &
au BufWinEnter *.c,*.cpp,*.h,*.hh,*.hpp set colorcolumn=+1

" Got to definition remap.
nnoremap <silent>gt <C-]>
" nnoremap <silent>gy <C-w>]
