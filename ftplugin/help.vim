if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" My brain confuses `<C-t>` and `K` in help files.
setlocal keywordprg=:help

let b:undo_ftplugin = "setlocal keywordprg<"
