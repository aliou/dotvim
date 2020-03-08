function! s:get_search_term(args, count) abort
  " Selection mode.
  if a:count > 0
    " TODO: fnameescape might not be needed.
    return shellescape(fnameescape(utils#current_selection()))
  endif

  if empty(a:args)
    return expand('<cword>')
  endif

  return a:args
endfunction

function! s:build_command(term) abort
  return join(['rg --vimgrep', a:term], ' ')
endfunction

function! search#run(args, count) abort
  let l:term = s:get_search_term(a:args, a:count)
  let l:search_command = s:build_command(l:term)

  call search#command#execute(l:search_command)
endfunction