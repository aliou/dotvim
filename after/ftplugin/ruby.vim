" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@
let b:undo_ftplugin .= " | setlocal iskeyword<"

" Manually set the regexp engine to try to improve performance.
set regexpengine=1

" Disable max textwidth and don't highlight color column for schema files.
if expand('%:t') == "schema.rb"
  set tw=0
endif
