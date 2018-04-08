function! s:find_project_directory() abort
  let l:project = expand('%:p:h')
  let l:previous = ''

  while l:project !=# l:previous && l:project !=# '/'
    if isdirectory(l:project . '/.git')
      return l:project
    endif
    let l:previous = l:project
    let l:project = fnamemodify(l:project, ':h')
  endwhile

  return ''
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
