local symbol = require('cstm.buffer.workspace').symbol

local on_attach = function(client, _)
  if not client.resolved_capabilities.workspace_symbol then return end

  vim.keymap.set('n', '<leader>ll', symbol, { desc = "[lsp] workspace symbol", buffer = true })
end

return {
  on_attach = on_attach
}
