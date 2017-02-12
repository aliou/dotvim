" Prepend linter name to the message.
let g:ale_echo_msg_format = '[%linter%] %s'

" Only run on save.
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
