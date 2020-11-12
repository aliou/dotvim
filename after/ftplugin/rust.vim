" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

if has('nvim')
  let b:ale_enabled = 0
  call cstm#lsp#setup_maps()
else
  " Use `rls` hover feature for help.
  nmap <silent> <buffer> K <plug>(ale_hover)
  let b:undo_ftplugin .= " | nunmap <buffer> K"
endif
