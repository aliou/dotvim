" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Match the formatter width.
setlocal textwidth=98
let b:undo_ftplugin .= " | setlocal textwidth<"
