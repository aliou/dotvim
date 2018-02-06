scriptencoding utf-8

let s:ale_running = 0
let s:ale_error_count = 0

function! status#ale_pre()
  let s:ale_running = 1
  redrawstatus
endfunction

function! status#ale_post()
  let s:ale_running = 0
  let s:ale_error_count = ale#statusline#Count(bufnr('')).total
  redrawstatus
endfunction

function! status#active()
  let l:statusline=''                 " Custom status line
  let l:statusline.='%#PmenuSel#'     " Use this for color
  let l:statusline.='[%n]%y'         " Buffer number and Filetype
  let l:statusline.=' %f%<'          " File name, truncated if too long.
  let l:statusline.='%m%r '          " Modified and read only flags.

  let l:statusline.='%='              " Right align the following

  let l:statusline.='%c ' " Use this for color
  let l:statusline.='%#CursorColumn#' " Use this for color
  let l:statusline.=' %p%% '         " Percentage through file

  let l:statusline.='%#PmenuSel#'
  let l:statusline.= s:ale_running ? ' ⋯ ' : s:ale_error_count ? ' ✗ ' : ' ✓ '

  return l:statusline
endfunction

function! status#inactive()
  let l:statusline='%#CursorColumn#' " Use this for color
  let l:statusline.=' %f%'          " File name, truncated if too long.

  return l:statusline
endfunction
