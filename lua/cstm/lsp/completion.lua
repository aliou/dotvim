local on_attach = function(_client)
  -- Use LSP as the handler for omnifunc.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

return {
  on_attach = on_attach
}
