scriptencoding utf-8

" TODO: Better handling of different buffers.
function! s:init()
  if !exists('b:ale_info')
    let b:ale_info = {'fixer': 0, 'linter': 0, 'error_count': 0}
  endif
endfunction

function! status#ale#pre_lint()
  call s:init()
  let b:ale_info.linter = 1
endfunction

function! status#ale#pre_fix()
  call s:init()
  let b:ale_info.fixer = 1
endfunction

function! status#ale#post_lint()
  call s:init()
  let b:ale_info.linter = 0
  let b:ale_info.error_count = ale#statusline#Count(bufnr('')).total
endfunction

function! status#ale#post_fix()
  call s:init()
  let b:ale_info.fixer = 0
endfunction

function! status#ale#indicators()
  call s:init()

  let l:fragment = ''

  " Ale status
  " - linter: Running | KO | OK
  " - Fixer:  Running | OK
  " TODO: Better colors ? Green / Red ting ?
  let l:fragment.='%#StatusPrimary#'
  let l:fragment.= b:ale_info.linter ? ' ⋯ ' : b:ale_info.error_count ? ' ✗ ' : ' ✓ '
  let l:fragment.='%#StatusSecondaryumn#'
  let l:fragment.= b:ale_info.fixer ? ' ⋯ ' : ' ✓ '

  return l:fragment
endfunction
