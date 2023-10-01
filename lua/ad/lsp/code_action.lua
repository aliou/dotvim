local on_attach = function(client)
  if not client.server_capabilities.codeActionProvider then return end

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[lsp] code action", buffer = true })
end

return {
  on_attach = on_attach
}
