scriptencoding utf-8

let s:ale_running = {'fixer': 0, 'linter': 0}
let s:ale_error_count = 0

" Set ALE as running.
function! status#ale#pre(scope)
  let s:ale_running[a:scope] = 1
  " let s:ale_running = 1
endfunction

" Set ALE as not running and store the total error and warning count.
function! status#ale#post(scope)
  let s:ale_running[a:scope] = 0
  " let s:ale_running = 0
  if a:scope ==# 'linter'
    let s:ale_error_count = ale#statusline#Count(bufnr('')).total
  end
endfunction

function! status#ale#indicators()
  let l:fragment = ''

  " Ale status
  " - linter: Running | KO | OK
  " - Fixer:  Running | OK
  " TODO: Better colors ? Green / Red ting ?
  let l:fragment.='%#PmenuSel#'
  let l:fragment.= s:ale_running['linter'] ? ' ⋯ ' : s:ale_error_count ? ' ✗ ' : ' ✓ '
  let l:fragment.='%#CursorColumn#'
  let l:fragment.= s:ale_running['fixer'] ? ' ⋯ ' : ' ✓ '

  return l:fragment
endfunction
