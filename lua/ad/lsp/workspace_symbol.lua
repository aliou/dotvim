local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<leader>ll", "<cmd>lua vim.lsp.buf.workspace_symbol('')<CR>")
end

return {
  on_attach = on_attach
}
