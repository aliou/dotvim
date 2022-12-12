local on_attach = function(client)
  if not client.server_capabilities.codeActionProvider then return end

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[lsp] code action", buffer = true })
  vim.keymap.set('v', '<leader>ca', ':<c-u>lua vim.lsp.buf.range_code_action()<cr>', { desc = "[lsp] code action", buffer = true })
end

return {
  on_attach = on_attach
}
