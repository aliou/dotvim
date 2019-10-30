" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@
