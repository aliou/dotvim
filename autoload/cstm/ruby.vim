function! cstm#ruby#documentation() abort
  let l:keyword = expand('<cword>')
  let l:command = 'ri ' . l:keyword
  let l:term_options = {
        \    'term_finish': 'close'
        \  }
  call term_start(['/bin/sh', '-c', l:command], l:term_options)
endfunction
