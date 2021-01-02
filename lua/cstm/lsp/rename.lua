local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
end

return {
  on_attach = on_attach
}
