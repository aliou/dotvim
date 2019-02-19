function! utils#fct#any(list, predicate)
  for l:element in a:list
    if a:predicate(l:element)
      return v:true
    endif
  endfor

  return v:false
endfunction
