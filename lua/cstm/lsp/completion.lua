local completion = require('completion')
local map = require('cstm.lsp.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.completion then
    return
  end
  -- Setup completion autocommands on attach with LSP client.
  -- TODO: See if we should have this in all cases instead of only when a LSP
  -- server is running for the current buffer.
  completion.on_attach()

  -- Toggle completion.
  map("n", "<leader>ct", ":CompletionToggle<CR>")
end

return {
  on_attach = on_attach
}
