local M = {}
local disabled_buffers = {}

-- TODO: Check if this doesn't already exists somewhere.
function bufnr()
  return vim.api.nvim_eval('bufnr()')
end

function M.buffer_is_disabled(bufnr)
  return disabled_buffers[bufnr] == true
end

function M.toggle_buffer()
  if M.buffer_is_disabled(bufnr()) then
    enable_buffer()
  else
    disable_buffer()
  end
end

function disable_buffer()
  -- Make the current buffer as diagnostics disabled.
  local current_bufnr = vim.api.nvim_eval('bufnr()')
  disabled_buffers[current_bufnr] = true

  -- Clear existing diagnostics
  local clients = vim.lsp.get_active_clients()
  for _key, client in pairs(clients) do
    vim.lsp.diagnostic.clear(current_bufnr, client.id, nil, nil)
  end
end

-- TODO: Find a way to reload diagnostics or something? I currently need to `:e`
-- or `:w` before seeing the diagnostics back.
function enable_buffer()
  local current_bufnr = vim.api.nvim_eval('bufnr()')
  disabled_buffers[current_bufnr] = nil
  vim.cmd('edit')
end

return M
