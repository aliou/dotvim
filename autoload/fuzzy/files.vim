function! s:rg_ignored_entries() abort
  " Return the already computed ignore entries stored in a buffer variable.
  if exists('b:rg_ignored_entries_value')
    return b:rg_ignored_entries_value
  endif

  " Exclude wildignore entries from search using the '-g' option of `rg`.
  " We prepend a '!' to the glob to tell rg we want to ignore the pattern.
  " `rg` also ignore `.gitignore`, `.hgignore`, etc files.
  let l:entries = split(&wildignore, ',')
  let l:ignore_list = ''
  for l:entry in l:entries
    let l:ignore_list .= ' -g ''!' . l:entry . ''''
  endfor

  " Add the current file to the ignored entries if it is listed as a buffer.
  if buflisted(bufnr(''))
    let l:current_file = expand('%')
    let l:ignore_list .= ' -g ''!' . l:current_file . ''''
  endif

  " Memoize the ignore entries.
  let b:rg_ignored_entries_value = l:ignore_list

  return l:ignore_list
endfunction

function! fuzzy#files#source(args) abort
  return 'rg ' . s:rg_ignored_entries() . ' -g "" --files ' . a:args
endfunction
