local lsp = require('vim.lsp')

local M = {}

-- Check if LSP is running by checking if we have clients for the current
-- buffer.
-- This will probably will be deleted once everything related to LSP is moved to
-- Lua files.
M.is_running = function()
  return #lsp.buf_get_clients() > 0
end

M.map = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

return M
