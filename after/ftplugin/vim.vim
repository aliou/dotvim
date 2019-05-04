" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" TODO: Figure out why trying to removing the mapping in `b:undo_ftplugin`
" errors. Maybe buffer maps are already removed when changing filetype?
nnoremap <buffer> <leader>so :source %<Return>
" let b:undo_ftplugin .= " | nunmap <leader>so"
