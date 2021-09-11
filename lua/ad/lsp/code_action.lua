local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<leader>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>")
end

return {
  on_attach = on_attach
}
