" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

if has('nvim')
  let b:ale_disable_lsp = 1
else
  " Use `rls` hover feature for help.
  nmap <silent> <buffer> K <plug>(ale_hover)
  let b:undo_ftplugin .= " | nunmap <buffer> K"
endif
