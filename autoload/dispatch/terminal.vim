" WIP implementation of terminal handler for dipsatch.
if exists('g:autoloaded_dispatch_terminal')
  finish
endif
let g:autoloaded_dispatch_terminal = 1

function! dispatch#terminal#handle(request) abort
  if !has('terminal') || a:request.action !=# 'make'
    return 0
  endif

  if a:request.action ==# 'make'
    let l:command = dispatch#prepare_make(a:request)
  elseif a:request.action ==# 'start'
    let l:command = dispatch#prepare_start(a:request)
  endif

  execute 'terminal ++close ' . l:command
endfunction
