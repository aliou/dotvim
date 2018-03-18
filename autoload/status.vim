scriptencoding utf-8

let s:ale_running = {'fixer': 0, 'linter': 0}
let s:ale_error_count = 0

" Set ALE as running.
function! status#ale_pre(scope)
  let s:ale_running[a:scope] = 1
  " let s:ale_running = 1
endfunction

" Set ALE as not running and store the total error and warning count.
function! status#ale_post(scope)
  let s:ale_running[a:scope] = 0
  " let s:ale_running = 0
  if a:scope ==# 'linter'
    let s:ale_error_count = ale#statusline#Count(bufnr('')).total
  end
endfunction

" TODO: Better ?
function! s:git_branch() abort
  let l:head = fugitive#head()
  if len(l:head) != 0
    return '[' . l:head . ']'
  endif
  return ''
endfunction

" TODO: Use custom highlight groups ?
function! status#active()
  " Custom status line
  let l:statusline=''
  " Use this color (pop up menu selected item)
  let l:statusline.='%#PmenuSel#'

  " Buffer number and Filetype
  let l:statusline.='%y'
  " Git Branch
  let l:statusline.=s:git_branch()

  " File name, truncated if too long.
  let l:statusline.=' %f%<'
  " Modified and read only flags.
  let l:statusline.='%m%r '

  " Right align the following
  let l:statusline.='%='

  " Current Column
  let l:statusline.='%c '
  " Use this for color (cursor column)
  let l:statusline.='%#CursorColumn#'
  " Percentage through file
  let l:statusline.=' %p%% '

  " Ale status
  " - linter: Running | KO | OK
  " - Fixer:  Running | OK
  " TODO: Better colors ? Green / Red ting ?
  let l:statusline.='%#PmenuSel#'
  let l:statusline.= s:ale_running['linter'] ? ' ⋯ ' : s:ale_error_count ? ' ✗ ' : ' ✓ '
  let l:statusline.='%#CursorColumn#'
  let l:statusline.= s:ale_running['fixer'] ? ' ⋯ ' : ' ✓ '

  return l:statusline
endfunction

function! status#inactive()
  " Use this for color (cursor column)
  let l:statusline='%#CursorColumn#'
  " Buffer number
  let l:statusline.='[%n]'
  " File name, truncated if too long.
  let l:statusline.=' %f%'

  return l:statusline
endfunction
