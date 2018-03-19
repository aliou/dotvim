" TODO: Better ?
function! status#git#branch() abort
  let l:head = fugitive#head()
  if len(l:head) != 0
    return '[' . l:head . ']'
  endif
  return ''
endfunction
