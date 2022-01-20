local on_attach = function(_)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[lsp] code action", buffer = true })
end

return {
  on_attach = on_attach
}
