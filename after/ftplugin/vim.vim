" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

nnoremap <buffer> <leader>so :source %<Return>
