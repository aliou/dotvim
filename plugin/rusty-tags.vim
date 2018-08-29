if exists('g:loaded_rust_tags')
  finish
endif

augroup rust_ctags_generatoin
  autocmd!

  autocmd BufWritePost *.rs call cstm#rust#tags#generate(expand('%:p:h'))
augroup END
