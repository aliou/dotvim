local map = require('cstm.util').map

local on_attach = function(client)
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
end

return {
  on_attach = on_attach
}
