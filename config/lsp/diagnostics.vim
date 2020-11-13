" XXX: Deprecated, will be in nvim-core. Might require to have the configuration
" in lua instead of vimscript.
if has('nvim')
  lua require('lsp/diagnostics')

  " Navigate around warnings / errors.
  " TODO: At some point merge these maps with the error maps from ALE, see
  " config/plugin/ale/maps.vim
  nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
endif
