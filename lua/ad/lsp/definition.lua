local map = require('cstm.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.goto_definition then return end

  map("n", "<C-]>", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
end

return {
  on_attach = on_attach
}
