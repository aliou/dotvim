" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

setlocal iskeyword+=-
let b:undo_ftplugin .= " | setlocal iskeyword<"
