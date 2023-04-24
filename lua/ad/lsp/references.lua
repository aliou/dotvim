local find_references = function()
  vim.lsp.buf.references({ includeDeclaration = false })
end

local on_attach = function(client)
  if not client.server_capabilities.referencesProvider then return end

  vim.keymap.set('n', '<C-\\>', find_references, { desc = "[lsp] references", buffer = true })
  vim.keymap.set('n', '<leader>lp', vim.lsp.buf.implementation, { desc = "[lsp] implementation", buffer = true })
end

return {
  on_attach = on_attach,
}
