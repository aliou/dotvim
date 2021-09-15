local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<C-\\>", "<cmd>lua require('ad.telescope.lsp').references()<CR>")
end

return {
  on_attach = on_attach,
}
