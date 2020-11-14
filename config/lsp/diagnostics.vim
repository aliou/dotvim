if has('nvim')
  lua require('lsp/diagnostic')

  " Navigate around warnings / errors.
  " TODO: At some point merge these maps with the error maps from ALE, see
  " config/plugin/ale/maps.vim
  nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

  " TODO: At some point, also merge this map with the buffer toggle from ALE,
  " see config/plugin/ale/maps.vim
  nnoremap <silent> <leader>dt <cmd>lua require('cstm.buffer.diagnostic').toggle()<CR>
endif
