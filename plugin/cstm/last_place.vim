let g:cstm_last_place_ignored_types = ['gitcommit', 'pullrequest', 'qif']

function! s:last_place() abort
  if index(g:cstm_last_place_ignored_types, &filetype) != -1
    return
  endif

  if line("'\"") > 0 && line("'\"") <= line('$')
    execute "normal g'\""
  endif
endfunction

augroup plugin_last_place
  autocmd!
  autocmd BufWinEnter * call s:last_place()
augroup END
