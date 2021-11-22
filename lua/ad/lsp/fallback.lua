local map = require('cstm.util').map

local print_message = function()
  print("lsp: not supported for current buffer")
end

local rhs = "<cmd>lua require('ad.lsp.fallback').print_message()<cr>"

map("n", "<leader>ca", rhs, { buffer = false })

map("n", "<leader>ct", rhs, { buffer = false })

map("n", "<leader>af", rhs, { buffer = false })
map('n', '<leader>ht', rhs, { buffer = false })
map("n", "<leader>rn", rhs, { buffer = false })

map("n", "<C-\\>", rhs, { buffer = false })

map("n", "<leader>ll", rhs, { buffer = false })

return {
  print_message = print_message
}
