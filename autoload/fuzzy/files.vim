" Generate an ignore file to pass to ripgrep containing the wildignore contents.
" TODO: See if it makes sense to also use the global vimrc.
function! s:rg_ignore_file() abort
  if exists('b:fuzzy_rg_ignore_file')
    return '--ignore-file ' . b:fuzzy_rg_ignore_file
  endif

  let b:fuzzy_rg_ignore_file = tempname()

  let l:current_file = buflisted(bufnr('')) ? expand('%:p') : ''

  " Ignore the wildignore entries, the current file and the defined ignore files
  " if any.
  let l:entries = split(&wildignore, ',') + get(g:, 'fuzzy_ignored_files', [])
        \ + [l:current_file]
  call writefile(l:entries, b:fuzzy_rg_ignore_file)

  return '--ignore-file ' . b:fuzzy_rg_ignore_file
endfunction

function! fuzzy#files#source(directory) abort
  " List the files using rg,
  " - Ignoring everything from the wildignore,
  " - from this directory.
  let l:command = 'rg --files --sort-files '
        \ . s:rg_ignore_file() . ' '
        \ . a:directory

  " Remove the path to the directory from the results if we're already in it.
  " The sed command is : `s_^<directory>__`, using `_` as a separator instead of
  " slashes.
  if a:args == getcwd()
    let l:command .= ' | sed "s|^' . a:args . '/||"'
  endif

  return l:command
endfunction

function! fuzzy#files#toggle_ignore() abort
  let g:fuzzy_include_hidden = !get(g:, 'fuzzy_include_hidden', 0)
endfunction

function! s:find_project_directory() abort
  let l:path = finddir('.git', expand('%:p:h').';')
  return fnamemodify(substitute(l:path, '\.git', '', ''), ':p:h')
endfunction

" Try to detect the current file's project.
" It tries to find the closest parent with a `.git` directory.
" If it doesn't find it, it uses the current file's directory.
"
" This should work most of the time /shrug.
function! fuzzy#files#source_directory() abort
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
