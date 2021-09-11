local map = require('cstm.util').map

local on_attach = function(client, _)
  if not client.resolved_capabilities.hover then return end

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

return {
  on_attach = on_attach
}
