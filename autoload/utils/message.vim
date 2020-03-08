function! utils#message#error(message)
  echohl ErrorMsg | echo a:message | echohl None
endfunction
