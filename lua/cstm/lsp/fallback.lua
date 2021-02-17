local map = require('cstm.util').map

local print_message = function()
  print("lsp: not supported for current buffer")
end

local rhs = "<cmd>lua require('cstm.lsp.fallback').print_message()<cr>"

map("n", "<leader>ca", rhs, { buffer = false })

map("n", "<leader>ct", rhs, { buffer = false })

map("n", "[a", rhs, { buffer = false })
map("n", "]a", rhs, { buffer = false })
map("n", "<leader>at", rhs, { buffer = false })

map("n", "<leader>af", rhs, { buffer = false })
map('n', '<leader>ht', rhs, { buffer = false })
map("n", "<leader>lr", rhs, { buffer = false })
map("n", "<leader>rn", rhs, { buffer = false })

map("n", "<C-\\>", rhs, { buffer = false })

map("n", "<leader>ll", rhs, { buffer = false })

return {
  print_message = print_message
}
