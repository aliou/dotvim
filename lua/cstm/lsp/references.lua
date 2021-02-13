local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<C-\\>", "<cmd>lua require('cstm.buffer.references').find()<CR>")
end

return {
  on_attach = on_attach,
}
