" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Use `tsserver` hover feature for help.
nmap <silent> <buffer> K <plug>(ale_hover)
let b:undo_ftplugin .= " | nunmap <buffer> K"

nmap <silent> <buffer> <c-]> <plug>(ale_go_to_definition)
let b:undo_ftplugin .= " | nunmap <buffer> <c-]>"
