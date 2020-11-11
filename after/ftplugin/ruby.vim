" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@
let b:undo_ftplugin .= " | setlocal iskeyword<"

" Manually set the regexp engine to try to improve performance.
set regexpengine=1

if has('nvim')
  let b:ale_enabled = 0
  call cstm#lsp#setup_maps()
  call cstm#lsp#setup_completion()
endif
