" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Use `rls` hover feature for help.
nmap <silent> <buffer> K <plug>(ale_hover)
" let b:undo_ftplugin .= " | nunmap <buffer> K"
