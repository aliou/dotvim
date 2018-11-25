function! s:init()
  if !exists('b:ale_info')
    let b:ale_info = {'fixer': 0, 'linter': 0, 'error_count': 0}
  endif
endfunction

function! status#ale#lightline#linter_indicator() abort
  call s:init()

  let l:fragment = ''
  let l:fragment.= b:ale_info.linter ? '⋯' : b:ale_info.error_count ? '✗' : '✓'

  return l:fragment
endfunction

function! status#ale#lightline#fixer_indicator() abort
  call s:init()

  let l:fragment = ''
  let l:fragment.= b:ale_info.fixer ? '⋯' : '✓'

  return l:fragment
endfunction
