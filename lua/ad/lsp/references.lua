local on_attach = function(_)
  vim.keymap.set('n', '<C-\\>', vim.lsp.buf.references, { desc = "[lsp] references", buffer = true })
end

return {
  on_attach = on_attach,
}
