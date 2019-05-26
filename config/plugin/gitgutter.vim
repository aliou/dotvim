let g:gitgutter_map_keys = 0

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

nnoremap <silent> <leader>gt :GitGutterSignsToggle<CR>

nmap <leader>hd <Plug>GitGutterUndoHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <leader>hp <Plug>GitGutterPreviewHunk

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='┃'
let g:gitgutter_sign_removed_first_line='┃'
let g:gitgutter_sign_modified_removed='┃'
