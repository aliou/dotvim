function! utils#list#insert(list, index, value) abort
  let l:before = a:list[0 : a:index - 1]
  let l:after = a:list[a:index : -1]
  return l:before + [a:value] + l:after
endfunction
