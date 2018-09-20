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
function! utils#dictionnary#merge(dict1, dict2, ...) abort
  " If no conflict resolver is passed, use a default conflict resolver returning
  " the value in the first dictionary.
  let l:Resolver = a:0 && type(a:1) == v:t_func ? a:1 : function('utils#dictionnary#keep_resolver')

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
