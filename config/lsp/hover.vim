if has('nvim')
  lua require('cstm.lsp.hover')

  nnoremap <silent> <plug>(lsp_hover) <cmd>lua vim.lsp.buf.hover()<cr>
end
