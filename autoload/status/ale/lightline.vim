let s:in_progress = '⋯'
let s:failure = '✗'
let s:success = '✓'

function! status#ale#lightline#linter_indicator() abort
  return s:success
endfunction

function! status#ale#lightline#fixer_indicator() abort
  return s:success
endfunction
