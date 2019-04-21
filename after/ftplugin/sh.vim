" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Consider `$` as part of a word text object.
setlocal iskeyword+=$
let b:undo_ftplugin .= " | set iskeyword<"
