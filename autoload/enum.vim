function! enum#any(enum, predicate) abort
  for l:element in a:enum
    if a:predicate(l:element)
      return v:true
    endif
  endfor

  return v:false
endfunction

function! util#map(enum, fct)
  let l:enum = deepcopy(a:enum)
  return map(enum, a:fct)
endfunction
