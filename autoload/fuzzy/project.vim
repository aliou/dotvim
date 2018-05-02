function! s:find_project_directory() abort
  let l:path = finddir('.git', expand('%:p:h').';')
  return fnamemodify(substitute(l:path, '\.git', '', ''), ':p:h')
endfunction

" Try to detect the current file's project.
" It tries to find the closest parent with a `.git` directory.
" If it doesn't find it, it uses the current file's directory.
"
" This should work most of the time /shrug.
function! fuzzy#project#directory() abort
  if exists('b:fuzzy_project_directory')
    return b:fuzzy_project_directory
  endif

  let l:project_directory = s:find_project_directory()
  if l:project_directory !=# ''
    let b:fuzzy_project_directory = l:project_directory
  else
    let b:fuzzy_project_directory = expand('%:p:h')
  endif

  return b:fuzzy_project_directory
endfunction
