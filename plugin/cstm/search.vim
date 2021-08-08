if exists('g:loaded_cstm_search')
  finish
endif

let g:loaded_cstm_search = 'ok'

" TODO: See if we can avoid this bridge between the Lua function and the vim
" command!.
function! s:complete(...)
  return luaeval("require('cstm.search').complete(_A[1], _A[2], _A[3])", a:000)
endfunction

command! -nargs=* -range=0 -complete=customlist,s:complete Search
      \ call cstm#search#run(<q-args>, <count>)

nnoremap <silent> s :set operatorfunc=cstm#search#operator<CR>g@
vnoremap <silent> s :<C-U>call cstm#search#operator(visualmode())<CR>
