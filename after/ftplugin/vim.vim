" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

nnoremap <buffer> <leader>so :source %<Return>

if has('nvim')
  " TODO: Do some magic with `path` or with vim-apathy so `gf` works on lua
  " imports.
endif
