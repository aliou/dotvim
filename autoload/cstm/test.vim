function! s:exit_callback(job, exit_code) abort
  if a:exit_code == 0
    wincmd q | wincmd p
  endif

  nnoremap <buffer> q :q<Return><C-w>p
endfunction

function! cstm#test#terminal_strategy(cmd) abort
  " botright 10new

  let l:term_options = {
        \    'term_rows': 10,
        \    'exit_cb': function('s:exit_callback')
        \  }
  call term_start(['/bin/sh', '-c', a:cmd], l:term_options)
endfunction
