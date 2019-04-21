" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Disable text width for HTML files.
set textwidth=0
" let b:undo_ftplugin .= " | set textwidth
