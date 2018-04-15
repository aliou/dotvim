" TODO: Ignore git commit files etc.
function! s:last_place() abort
  if line("'\"") > 0 && line("'\"") <= line('$')
    exe "normal g'\""
  endif
endfunction

augroup plugin_last_place
  autocmd!
  autocmd BufWinEnter * call s:last_place()
augroup END
