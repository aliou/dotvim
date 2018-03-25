" TODO: Since `v:oldfiles` barely changes during a session, it might be useful to memoize it ?
function! fuzzy#mru#list() abort
  if !exists('g:fuzzy#mru#limit')
    let g:fuzzy#mru#limit = 100
  endif

  let l:sublimit = g:fuzzy#mru#limit < 2 ? 2 : g:fuzzy#mru#limit - 1
  let l:files = copy(v:oldfiles[:l:sublimit])

  return l:files
endfunction

function! fuzzy#mru#complete(argument_lead, cmd_line, cursor_position) abort
  return filter(copy(fuzzy#mru#list()), 'v:val =~ a:argument_lead')
endfunction
