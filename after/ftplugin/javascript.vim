" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Relative path in some of my javascript project.
setlocal path+=**
let b:undo_ftplugin .= " | setlocal path<"
