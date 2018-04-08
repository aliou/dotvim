function! s:is_not_current(_index, file) abort
  return buflisted(bufnr('')) && expand(a:file) !=# expand('%:p')
endfunction

" TODO: Since `v:oldfiles` barely changes during a session, it might be useful to memoize it ?
function! fuzzy#mru#list() abort
  " Limit the number of files to be returned.
  if !exists('g:fuzzy#mru#limit')
    let g:fuzzy#mru#limit = 500
  endif
  let l:sublimit = g:fuzzy#mru#limit < 2 ? 2 : g:fuzzy#mru#limit

  " Slice the file list and filter out the current file.
  let l:files = filter(copy(v:oldfiles[:l:sublimit]), function('s:is_not_current'))

  return l:files
endfunction

function! fuzzy#mru#complete(argument_lead, cmd_line, cursor_position) abort
  return filter(fuzzy#mru#list(), 'v:val =~ a:argument_lead')
endfunction
