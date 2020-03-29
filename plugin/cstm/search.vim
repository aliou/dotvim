if exists('g:loaded_cstm_search')
  finish
endif

let g:loaded_cstm_search = 'ok'

command! -nargs=* -range=0 -complete=dir Search
      \ call cstm#search#run(<q-args>, <count>)

command! -nargs=* -range=0 -complete=dir Ack
      \ call cstm#search#legacy#ack()

nnoremap <silent> <leader>ss :Search<Return>
