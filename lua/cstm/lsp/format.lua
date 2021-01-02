local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<leader>af", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

return {
  on_attach = on_attach
}
