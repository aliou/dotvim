function! s:is_not_current(_index, file) abort
  return buflisted(bufnr('')) ? expand(a:file) !=# expand('%:p') : v:true
endfunction

function! s:resolve_file(_index, file) abort
  return substitute(a:file, '\~', $HOME, '')
endfunction

" TODO: Since `v:oldfiles` barely changes during a session, it might be useful to memoize it ?
function! cstm#fuzzy#mru#list() abort
  " Limit the number of files to be returned.
  if !exists('g:cstm#fuzzy#mru#limit')
    let g:cstm#fuzzy#mru#limit = 500
  endif
  let l:sublimit = g:cstm#fuzzy#mru#limit < 2 ? 2 : g:cstm#fuzzy#mru#limit

  " Slice the file list and filter out the current file.
  let l:files = filter(copy(v:oldfiles[:l:sublimit]), function('s:is_not_current'))

  " Resolve the path of the files.
  let l:resolved_files = map(l:files, function('s:resolve_file'))

  return l:resolved_files
endfunction

function! cstm#fuzzy#mru#complete(argument_lead, cmd_line, cursor_position) abort
  return filter(cstm#fuzzy#mru#list(), 'v:val =~ a:argument_lead')
endfunction
