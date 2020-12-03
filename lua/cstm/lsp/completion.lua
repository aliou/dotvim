local completion = require('completion')
local on_attach = function(_)
  -- Use LSP as the handler for omnifunc.
  -- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Setup completion autocommands on attach with LSP client.
  -- TODO: See if we should have this in all cases instead of only when a LSP
  -- server is running for the current buffer.
  completion.on_attach()
end

return {
  on_attach = on_attach
}
