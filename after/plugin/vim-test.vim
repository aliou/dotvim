" make test commands execute using dispatch.vim
let test#strategy = 'dispatch'

" Run all of the Bats test files.
let test#shell#bats#options = {
      \   'suite': 'test/**/*.bats'
      \ }
