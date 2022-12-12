local on_attach = function(client)
  if not client.server_capabilities.definitionProvider then return end

  vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, { desc = "[lsp] go to definition", buffer = true })
end

return {
  on_attach = on_attach
}
