autocmd BufRead,BufNewFile * call s:detectSwift()

function! s:detectSwift()
  if getline(1) =~# '^#!.*\<swift\>'
    let &filetype = 'swift'
  endif
endfunction
