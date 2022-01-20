local on_attach = function(client)
  if not client.resolved_capabilities.goto_definition then return end

  vim.keymap.set('n', '<C-]>', require('telescope.builtin').lsp_definitions, { desc = "[lsp] go to definition", buffer = true })
end

return {
  on_attach = on_attach
}
