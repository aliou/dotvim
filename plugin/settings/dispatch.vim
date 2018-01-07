" Add custom dispatch handler. (terminal)
" TODO: Append `terminal` to the array in an autocommand.
let g:dispatch_handlers = [
      \ 'tmux', 'screen', 'windows',
      \ 'iterm', 'x11', 'headless', 'terminal',
      \ ]
