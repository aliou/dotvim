local find_references = function()
  vim.lsp.buf.references({ includeDeclaration = false })
end

local on_attach = function(client)
  if not client.resolved_capabilities.find_references then return end

  vim.keymap.set('n', '<C-\\>', find_references, { desc = "[lsp] references", buffer = true })
end

return {
  on_attach = on_attach,
}
