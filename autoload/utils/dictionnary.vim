" The discrepancy regarding variable names in this file is because funcrefs
" variable name must start with a capital letter. (E704)

function! utils#dictionnary#keep_resolver(_key, v1, _v2) abort
  return a:v1
endfunction

function! utils#dictionnary#overwrite_resolver(_key, _v1, v2) abort
  return a:v2
endfunction

function! utils#dictionnary#append_resolver(_key, v1, v2) abort
  return a:v1 . ' ' . a:v2
endfunction

" TODO: Check that the first two arguments are Dictionaries.
" TODO: Check that when given, the third argument is a funcref or a function.
" TODO: This is probably slow in big dictionaries ?
" TODO: Tests lol
" TODO: Allow passing a string to know which resolver to use. Look at how
" vim-projectionist handles transformations.
" TODO: Allow passing more thant two dicts.
function! utils#dictionnary#merge(dict1, dict2, ...) abort
  " If no conflict resolver is passed, use a default conflict resolver returning
  " the value in the first dictionary.
  let l:Resolver = a:0 && type(a:1) == v:t_func ? a:1 : function('utils#dictionnary#keep_resolver')

  " Start by copying the first dictionary to prevent side effects.
  let l:result = copy(a:dict1)

  " List conflicting keys.
  let l:KeySearcher = {_idx, key -> index(keys(l:result), key) != -1}
  let l:conflicting_keys = filter(keys(a:dict2), l:KeySearcher)

  " Merge the dictionnaries.
  for [l:key, l:Value] in items(a:dict2)
    " Call conflict resolver on each of the conflicting keys with both values.
    if index(l:conflicting_keys, l:key)
      let l:Val2 = a:dict2[l:key]
      let l:result[l:key] = l:Resolver(l:key, l:Value, l:Val2)
    else
      let l:result[l:key] = l:Value
    endif
  endfor

  return l:result
endfunction
