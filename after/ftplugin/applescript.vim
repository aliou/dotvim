" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" I like this one better /shrug.
setlocal commentstring=--\ %s
let b:undo_ftplugin .= " | setlocal commentstring<"
