local on_attach = function(_)
  vim.keymap.set('n', '<C-\\>', require('ad.telescope.lsp').references, { desc = "[lsp] references", buffer = true })
end

return {
  on_attach = on_attach,
}
