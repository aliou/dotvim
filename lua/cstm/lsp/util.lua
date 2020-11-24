local lsp = require('vim.lsp')

local M = {}

M.is_running = function()
  return not vim.tbl_isempty(lsp.get_active_clients())
end

return M
