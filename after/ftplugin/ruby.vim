setlocal nonumber
setlocal norelativenumber
setlocal nocursorline

" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@

nnoremap <silent> <buffer> K :call cstm#ruby#documentation()<CR>
nnoremap <silent> <buffer> <c-\> :call cstm#ruby#ptag()<CR>
