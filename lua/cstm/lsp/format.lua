local map = require('cstm.lsp.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.document_formatting then
    return
  end

  map("n", "<leader>af", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

return {
  on_attach = on_attach
}
