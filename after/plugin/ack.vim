" Use `rg` if available.
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:ack_use_dispatch = 1
