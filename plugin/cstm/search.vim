if exists('g:loaded_cstm_search')
  finish
endif

let g:loaded_cstm_search = 'ok'

command! -nargs=* -range=0 -complete=dir Search
      \ call cstm#search#run(<q-args>, <count>)

command! -nargs=* -range=0 -complete=dir Ack
      \ call cstm#search#legacy#ack()

nnoremap <silent> <leader>ss :call cstm#search#legacy#map()<CR>

nnoremap <silent> s :set operatorfunc=cstm#search#operator<CR>g@
vnoremap <silent> s :<C-U>call cstm#search#operator(visualmode())<CR>
