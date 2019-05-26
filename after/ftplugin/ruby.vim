" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@
let b:undo_ftplugin .= " | set iskeyword<"

iabbrev describled_class described_class
let b:undo_ftplugin .= " | iunabbrev describled_class"
