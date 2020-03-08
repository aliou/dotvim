" if exists('g:loaded_search')
"   finish
" endif

" let g:loaded_search = 'ok'

command! -nargs=? -range=0 Search call search#run(<q-args>, <count>)
