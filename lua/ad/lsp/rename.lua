local on_attach = function(client)
  if not client.server_capabilities.renameProvider then return end

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "[lsp] rename", buffer = true })
end

return {
  on_attach = on_attach
}
