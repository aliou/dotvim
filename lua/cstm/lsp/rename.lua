local map = require('cstm.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.rename then return end

  -- TODO: Remove the less used mapping.
  map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
end

return {
  on_attach = on_attach
}
