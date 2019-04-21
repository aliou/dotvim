" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

setlocal commentstring=//\ %s
let b:undo_ftplugin .= " | setlocal commentstring<"
