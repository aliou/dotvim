if has('nvim')
  lua require('cstm.lsp.code_action')

  " Trigger code action request.
  nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
end
