function! s:swap_lines(n1, n2)
  let line1 = getline(a:n1)
  let line2 = getline(a:n2)
  call setline(a:n1, line2)
  call setline(a:n2, line1)
endfunction

function! s:swap_up()
  " let n = line('.')
  " if n == 1
  "   return
  " endif
  "
  " call s:swap_lines(n, n - 1)
  " exec n - 1
  echom "Use [e from unimpaired"
endfunction

function! s:swap_down()
  " let n = line('.')
  " if n == line('$')
  "   return
  " endif
  "
  " call s:swap_lines(n, n + 1)
  " exec n + 1
  echom "Use ]e from unimpaired"
endfunction

noremap <silent> <c-k> :call <SID>swap_up()<CR>
noremap <silent> <c-j> :call <SID>swap_down()<CR>
