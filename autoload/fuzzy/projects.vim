function! fuzzy#projects#list() abort
  return globpath("/Users/alioudiallo/code/src/github.com/", "*/*", 0, 1)
endfunction
