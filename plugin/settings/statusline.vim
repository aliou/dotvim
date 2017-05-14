set statusline=
" Branch name or help buffer flag, or preview buffer flag.
set statusline+=%#PmenuSel#
set statusline+=\ %{fugitive#head(7)}%h%w\ 

" Filename + Modified flag
set statusline+=%#Menu#
set statusline+=\ %f
set statusline+=\ %y
set statusline+=%m
set statusline+=%=

set statusline+=%#CursorColumn#
set statusline+=\ %l\|%c
set statusline+=\ %p%%\ 
