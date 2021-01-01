local map = require('cstm.util').map

local on_attach = function(client)
  -- -- Sometimes, code_action is a boolena, other times an object.
  -- if not client.resolved_capabilities.code_action then return end
  -- if #client.resolved_capabilities.code_action.codeActionKinds == 0 then
  --   return
  -- end

  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
end

return {
  on_attach = on_attach
}
