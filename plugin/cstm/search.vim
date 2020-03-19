if exists('g:loaded_cstm_search')
  finish
endif

let g:loaded_cstm_search = 'ok'

command! -nargs=* -range=0 -complete=dir Search
      \ call cstm#search#run(<q-args>, <count>)

command! -nargs=* -range=0 -complete=dir Ack
      \ call cstm#search#ack_legacy(<q-args>, <count>)

nnoremap <silent> <leader>ss :Search<Return>
