-- local find_references = function()
--   vim.lsp.buf.references({ includeDeclaration = false })
-- end

local on_attach = function(client)
  if not client.server_capabilities.referencesProvider then return end

  vim.keymap.set('n', '<C-\\>', '<CMD>Glance references<CR>', { desc = "[lsp] references", buffer = true })
  vim.keymap.set('n', '<leader>lp', '<CMD>Glance implementations<CR>', { desc = "[lsp] implementation", buffer = true })
end

return {
  on_attach = on_attach,
}
