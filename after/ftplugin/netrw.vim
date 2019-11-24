" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Prevent my muscle memory from saving netrw files.
" TODO: Also map saving commands to be no-ops. (My muscle memory seems to always
" run `:w` with `!`.
setlocal readonly

" This took me 3 months to solve.
" Vinegar's generates a normal recursive map for the `-` key. This generated map
" has a trailing space. Because I also have a mapping on `<space>`, this meant
" that every time I called `-`, it also called the mapping on `<space>` and gave
" me the error `E490: No fold found`.

" For some reason, we cannot call :unmap here. /shrug
" We also cannot call :mapclear as this would remove the Vinegar mappings.
nnoremap <buffer> <space> <space>
let b:undo_ftplugin .= " | nunmap <buffer> <space>"
