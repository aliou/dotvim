local format = function()
  vim.lsp.buf.format({ timeout_ms = 2000 })
end

local on_attach = function(client)
  if not client.server_capabilities.documentFormattingProvider then return end

  vim.keymap.set('n', '<leader>af', format, { desc = "[lsp] format document", buffer = true })
end

return {
  on_attach = on_attach
}
