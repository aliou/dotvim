function! fuzzy#projects#list() abort
  return globpath("/Users/alioudiallo/code/src/github.com/", "*/*", 0, 1)
endfunction

function! s:search(query) abort
  return filter(fuzzy#projects#list(), 'v:val =~ a:query')
endfunction

function! fuzzy#projects#complete(argument_lead, cmd_line, cursor_position) abort
  return s:search(a:argument_lead)
endfunction
