" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

if has('nvim')
  let b:ale_enabled = 0
  call cstm#lsp#setup_maps()
  call cstm#lsp#setup_completion()
else
  " Use `tsserver` hover feature for help.
  nmap <silent> <buffer> K <plug>(ale_hover)

  " Use `tsserver` hover feature for jumping to definition.
  nmap <silent> <buffer> <c-]> <plug>(ale_go_to_definition)
endif
