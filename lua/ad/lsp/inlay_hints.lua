local inlay_hints = require('cstm.buffer.inlay_hints')

-- Setup inlay hints in this file, but only for rust_analyzer.
-- TODO: Use capabilities instead of the client name.
local on_attach = function(client)
  if client.name ~= "rust_analyzer" then return end

  -- Enable hints for the current buffer.
  inlay_hints.enable()

  -- Toggle inlay hints.
  vim.keymap.set('n', '<leader>ht', require('cstm.buffer.inlay_hints').toggle, { desc = "[lsp] toggle inlay hints", buffer = true })
end

return {
  on_attach = on_attach
}
