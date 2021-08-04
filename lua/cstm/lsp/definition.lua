local map = require('cstm.util').map
local get_buf_filetypes = require('cstm.util').get_buf_filetypes

local on_attach = function(client)
  if not client.resolved_capabilities.goto_definition then return end

  map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
end

return {
  on_attach = on_attach
}
