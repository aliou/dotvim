" Prepend linter name to the message.
let g:ale_echo_msg_format = '[%linter%] %s'

" Only run on save.
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Disable population of location list.
let g:ale_set_loclist = 0

" Let shellcheck follow external sources.
let g:ale_sh_shellcheck_options = '-x'

" Disable Ale for Fastlane file.
let g:ale_pattern_options =
      \ {
      \   'Fastfile$': { 'ale_enabled': 0 },
      \   'Appfile$': { 'ale_enabled': 0 },
      \   'Matchfile$': { 'ale_enabled': 0 }
      \ }

nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
