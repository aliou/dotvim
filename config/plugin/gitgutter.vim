let g:gitgutter_map_keys = 0

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nmap <leader>hd <Plug>GitGutterUndoHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <leader>hp <Plug>GitGutterPreviewHunk

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_override_sign_column_highlight = 0

hi! GitGutterAdd guifg=#d7ffaf ctermfg=193 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE term=NONE
hi! GitGutterChange guifg=#d7d7ff ctermfg=189 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE term=NONE
hi! GitGutterDelete guifg=#1d1f21 ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE term=NONE
hi! GitGutterChangeDelete guifg=#1d1f21 ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE term=NONE
