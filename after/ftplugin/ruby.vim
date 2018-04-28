setlocal nonumber
setlocal norelativenumber
setlocal nocursorline

" Consider `!` and `?` as part of a word text object.
setlocal iskeyword+=!,?

nnoremap <silent> <buffer> K :call cstm#ruby#documentation()<CR>
