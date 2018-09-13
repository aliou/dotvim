function! fuzzy#projects#list() abort
  return globpath("/Users/alioudiallo/code/src/github.com/", "*/*", 0, 1)
endfunction

function! s:search(query) abort
  return filter(fuzzy#projects#list(), 'v:val =~ a:query')
endfunction

function! fuzzy#projects#complete(argument_lead, cmd_line, cursor_position) abort
  return s:search(a:argument_lead)
endfunction

function! fuzzy#projects#handler(project_directory) abort
  " Try to find the directoy from the list. Don't do anything if we don't have
  " any matches.
  let l:candidates = s:search(a:project_directory)
  if len(l:candidates) == 0 | return | endif
  let l:directory = l:candidates[0]

  " Move to the given directory.
  execute 'cd' l:directory

  " netrw the directory.
  " TODO: Either
  " - Open the main project file (readme, todo, etc)
  " - Open startify.
  execute 'edit' l:directory

  " TODO: Set the title of gvim to the project name.
  if has('gui')
    " set titlestring=
  endif
endfunction
