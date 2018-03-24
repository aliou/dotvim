function! s:rg_ignored_entries() abort
  " Memoize the ignored entries.
  if exists('s:rg_ignored_entries_value')
    return s:rg_ignored_entries_value
  endif

  " Exclude wildignore entries from search using the '-g' option of `rg`.
  " We prepend a '!' to the glob to tell rg we want to ignore the pattern.
  " `rg` also ignore `.gitignore`, `.hgignore`, etc files.
  let l:entries = split(&wildignore, ',')
  let l:ignore_list = ''
  for l:entry in l:entries
    let l:ignore_list .= ' -g ''!' . l:entry . ''''
  endfor

  let s:rg_ignored_entries_value = l:ignore_list

  return l:ignore_list
endfunction

function! fuzzy#files#source(args) abort
  return 'rg ' . s:rg_ignored_entries() . ' -g "" --files ' . a:args
endfunction
