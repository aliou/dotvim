local map = require('cstm.lsp.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.hover then
    return
  end

  -- TODO: Ignore vim and ruby filetypes?
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

return {
  on_attach = on_attach
}
