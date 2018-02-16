scriptencoding utf-8

let s:ale_running = 0
let s:ale_error_count = 0

" Set ALE as running.
function! status#ale_pre()
  let s:ale_running = 1
  redrawstatus
endfunction

" Set ALE as not running and store the total error and warning count.
function! status#ale_post()
  let s:ale_running = 0
  let s:ale_error_count = ale#statusline#Count(bufnr('')).total
  redrawstatus
endfunction

" TODO: Use custom highlight groups ?
function! status#active()
  " Custom status line
  let l:statusline=''
  " Use this color (pop up menu selected item)
  let l:statusline.='%#PmenuSel#'

  " Buffer number and Filetype
  let l:statusline.='[%n]%y'
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

  " Use this color (pop up menu selected item)
  let l:statusline.='%#PmenuSel#'
  " Ale status (running, ko, ok)
  let l:statusline.= s:ale_running ? ' ⋯ ' : s:ale_error_count ? ' ✗ ' : ' ✓ '

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
