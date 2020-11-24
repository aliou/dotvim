local lsp = require('vim.lsp')

local M = {}

M.is_running = function()
  -- TODO: Check active clients for the current buffer.
  return not vim.tbl_isempty(lsp.get_active_clients())
end

return M
