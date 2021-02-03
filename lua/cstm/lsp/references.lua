local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<C-[>", "<cmd>lua vim.lsp.buf.references()<CR>")
end

return {
  on_attach = on_attach
}
