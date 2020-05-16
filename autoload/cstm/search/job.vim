function! cstm#search#job#execute(command) abort
  if utils#is_neovim()
    call cstm#search#job#nvim#execute(a:command)
  else
    call cstm#search#job#vim#execute(a:command)
  endif
endfunction
