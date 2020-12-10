local map = require('cstm.lsp.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.rename then return end

  map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
end

return {
  on_attach = on_attach
}
