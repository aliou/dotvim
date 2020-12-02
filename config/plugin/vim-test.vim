" TODO: Create a custom strategy that runs dispatch but with the floating window
" handler.
" To do this, it manually builds the request and calls dispatch with the
" floating_window handler.

let g:test#strategy = 'dispatch'

" Run all of the Bats test files.
let g:test#shell#bats#options = {
      \   'suite': 'test/**/*.bats'
      \ }
