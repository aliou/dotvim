function! enum#any(enum, predicate) abort
  for l:element in a:enum
    if a:predicate(l:element)
      return v:true
    endif
  endfor

  return v:false
endfunction

function! enum#map(enum, fct)
  let l:enum = deepcopy(a:enum)
  return map(enum, a:fct)
endfunction

function! enum#each(enum, fct)
  for l:element in a:enum
    call a:fct(l:element)
  endfor
endfunction


function! enum#filter(enum, predicate)
  let l:result = []

  for l:element in a:enum
    if a:predicate(l:element)
      call add(l:result, l:element)
    endif
  endfor

  return l:result
endfunction
