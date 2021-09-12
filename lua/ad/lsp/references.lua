local map = require('cstm.util').map

local on_attach = function(_)
  map("n", "<C-\\>",
    "<cmd>lua require('telescope.builtin').lsp_references({ includeDeclaration = false })<CR>")
end

return {
  on_attach = on_attach,
}
