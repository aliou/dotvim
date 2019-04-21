if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" Close window
nnoremap <buffer> <silent> q :cclose \| :lclose<CR>
let b:undo_ftplugin = "nunmap <buffer> q"

" Disable text width to prevent weird display issues.
setlocal textwidth=0
let b:undo_ftplugin .= " | setlocal textwidth<"
