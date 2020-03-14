let g:test#strategy = 'dispatch'

" Run all of the Bats test files.
let g:test#shell#bats#options = {
      \   'suite': 'test/**/*.bats'
      \ }
