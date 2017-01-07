" Remove separators.
let g:airline_left_sep=''
let g:airline_right_sep=''

" Disable Git Hunks section.
let g:airline#extensions#hunks#enabled = 0

" Simplify mode display.
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline_theme='lucius'
