if exists('g:loaded_cstm_swap')
  finish
endif

let g:loaded_cstm_swap = 'ok'

nnoremap <silent> <Plug>CstmSwapUp :call cstm#swap#execute(v:count1)<CR>
nnoremap <silent> <Plug>CstmSwapDown :call cstm#swap#execute(-v:count1)<CR>

nmap <C-A> <Plug>CstmSwapUp
nmap <C-X> <Plug>CstmSwapDown
