if has('nvim')
  lua require('cstm.lsp.rename')

  nnoremap <silent> <leader>lr <cmd>lua require('cstm.lsp.rename').rename()<cr>
end
