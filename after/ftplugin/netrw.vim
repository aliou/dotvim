" Prevent my muscle memory from saving netrw files.
setlocal readonly

" This took me 3 months to solve.
" Vinegar's generates a normal recursive map for the `-` key. This generated map
" has a trailing space. Because I also have a mapping on `<space>`, this meant
" that every time I called `-`, it also called the mapping on `<space>` and gave
" me the error `E490: No fold found`.

" For some reason, we cannot call :unmap here. /shrug
" We also cannot call :mapclear as this would remove the Vinegar mappings.
nnoremap <buffer> <space> <space>
