" The ___ for variable names in this file is because funcrefs variable name must
" start by a capital letter. (E704)
let s:default_resolver = {_key, v1, _v2 -> v1}

" TODO: Check that the first two arguments are Dictionaries.
" TODO: Check that when given, the third argument is a funcref or a function.
" TODO: This is probably slow in big dictionaries ?
" TODO: Tests lol
function! utils#dictionnary#merge(dict1, dict2, ...) abort
  " If no conflict resolver is passed, use a default conflict resolver returning
  " the value in the first dictionary.
  let l:Resolver = a:0 && type(a:1) == v:t_func ? a:1 : s:default_resolver

  " Start by copying the first dictionary to prevent side effects.
  let l:result = copy(a:dict1)

  " List conflicting keys.
  let l:KeySearcher = {_idx, key -> index(keys(l:result), key) != -1}
  let l:conflicting_keys = filter(keys(a:dict2), l:KeySearcher)

  " Call conflict resolver on each of the conflicting keys with both values.
  for l:key in l:conflicting_keys
    let l:val1 = l:result[l:key]
    let l:val2 = a:dict2[l:key]
    let l:result[l:key] = l:Resolver(l:key, l:val1, l:val2)
  endfor

  return l:result
endfunction
