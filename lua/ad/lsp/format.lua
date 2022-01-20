local on_attach = function(client)
  if not client.resolved_capabilities.document_formatting then return end

  vim.keymap.set('n', '<leader>af', vim.lsp.buf.formatting, { desc = "[lsp] format document", buffer = true })
end

return {
  on_attach = on_attach
}
