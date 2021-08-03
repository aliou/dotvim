local map = require('cstm.util').map
local inlay_hints = require('cstm.buffer.inlay_hints')

-- Setup inlay hints in this file, but only for rust_analyzer.
local on_attach = function(client)
  if client.name ~= "rust_analyzer" then return end

  -- Enable hints for the current buffer.
  inlay_hints.enable()

  -- Toggle inlay hints.
  map('n', '<leader>ht', "<cmd>lua require('cstm.buffer.inlay_hints').toggle()<CR>")
end

return {
  on_attach = on_attach
}
