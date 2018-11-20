" TODO: Use custom highlight groups ?
function! status#active()
  " Custom status line
  let l:statusline=''
  " Use this color (pop up menu selected item)
  let l:statusline.='%#StatusPrimary#'

  " Buffer number and Filetype
  let l:statusline.='%y'
  " Git Branch
  let l:statusline.=status#git#branch()

  " File name, truncated if too long.
  let l:statusline.=' %f%<'
  " Modified and read only flags.
  let l:statusline.='%m%r '

  " Right align the following
  let l:statusline.='%='

  " Current Column
  let l:statusline.='%c '
  " Use this for color (cursor column)
  let l:statusline.='%#StatusSecondary#'
  " Percentage through file
  let l:statusline.=' %03p%% '

  let l:statusline.=status#ale#indicators()

  return l:statusline
endfunction

function! status#inactive()
  " Use this for color (cursor column)
  let l:statusline='%#StatusSecondary#'
  " Buffer number
  let l:statusline.='[%n]'
  " File name, truncated if too long.
  let l:statusline.=' %f%'

  return l:statusline
endfunction

function! status#empty()
  let l:statusline='%#StatusSecondary#'

  return l:statusline
endfunction

function! status#fuzzy()
  let l:statusline='%#StatusSecondary#'

  let l:statusline.='[Fuzzy] '
  let l:statusline.=fuzzy#title()

  return l:statusline
endfunction
