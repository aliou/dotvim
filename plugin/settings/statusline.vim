set statusline=                 " Custom status line
set statusline+=%#PmenuSel#     " Use this for color
set statusline+=\[%n]%y         " Buffer number and Filetype
set statusline+=\ %f%<          " File name, truncated if too long.
set statusline+=%m%r\           " Modified and read only flags.

set statusline+=%=              " Right align the following

set statusline+=%#CursorColumn# " Use this for color
set statusline+=\ %p%%          " Percentage through file
set statusline+=\               " Trailing space
