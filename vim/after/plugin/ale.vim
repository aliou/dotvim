" Prepend linter name to the message.
let g:ale_echo_msg_format = '[%linter%] %s'

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
