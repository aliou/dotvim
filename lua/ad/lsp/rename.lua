local on_attach = function(_)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "[lsp] rename", buffer = true })
end

return {
  on_attach = on_attach
}
