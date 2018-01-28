function! status#active()
  let l:statusline=''                 " Custom status line
  let l:statusline.='%#PmenuSel#'     " Use this for color
  let l:statusline.='[%n]%y'         " Buffer number and Filetype
  let l:statusline.=' %f%<'          " File name, truncated if too long.
  let l:statusline.='%m%r '          " Modified and read only flags.

  let l:statusline.='%='              " Right align the following

  let l:statusline.='%#CursorColumn#' " Use this for color
  let l:statusline.=' %p%% '         " Percentage through file

  return l:statusline
endfunction

function! status#inactive()
  let l:statusline='%#CursorColumn#' " Use this for color
  let l:statusline.=' %f%'          " File name, truncated if too long.

  return l:statusline
endfunction
