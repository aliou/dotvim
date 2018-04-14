" Use `rg` if available.
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Run in the background using through Dispatch.
let g:ack_use_dispatch = 1
