" Create custom test strategy using Vim 8's `terminal`.
let g:test#custom_strategies = {
      \   'cstm_terminal': function('cstm#test#terminal_strategy')
      \ }

let g:test#strategy = 'dispatch'

" Run all of the Bats test files.
let g:test#shell#bats#options = {
      \   'suite': 'test/**/*.bats'
      \ }
