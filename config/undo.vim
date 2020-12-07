inoremap <C-U> <C-G>u<C-U>

" Keep screeds of undo history
set undolevels=1500

" 'undodir' and 'undofile' settings will be taken care of by the
" auto_undodir.vim plugin if applicable/possible
if has('persistent_undo')
  " Don't keep undo files from temporary directories or shared memory in case
  " they're secrets
  if has('autocmd')
    augroup cstm.undo
      autocmd!
      autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
            \ setlocal noundofile
    augroup END
  endif
endif
