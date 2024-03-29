local on_attach = function(client, _)
  if not client.server_capabilities.hoverProvider then return end

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "[lsp] hover", buffer = true })
end

return {
  on_attach = on_attach
}
