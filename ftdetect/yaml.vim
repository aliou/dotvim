autocmd BufRead,BufNewFile * call s:detectYaml()

function! s:detectYaml()
  if getline(1) =~# '^#!.*\<whalebrew\>'
    let &filetype = 'yaml'
  endif
endfunction
