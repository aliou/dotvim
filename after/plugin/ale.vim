" Prepend linter name to the message.
let g:ale_echo_msg_format = '[%linter%] %s'

" Only run on save.
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Disable population of location list.
let g:ale_set_loclist = 0

" Let shellcheck follow external sources.
let g:ale_sh_shellcheck_options = '-x'

" Use the relaxed configuration for yamllint.
let g:ale_yaml_yamllint_options = '-d relaxed'

nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
