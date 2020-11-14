local M = {}

-- Table storing the disabled buffers.
local disabled_buffers = {}

function M.is_disabled(bufnr)
  return disabled_buffers[bufnr] == true
end

function M.toggle()
  if M.is_disabled(vim.fn.bufnr()) then
    enable_buffer()
  else
    disable_buffer()
  end
end

function disable_buffer()
  -- Make the current buffer as diagnostics disabled.
  disabled_buffers[vim.fn.bufnr()] = true

  -- Clear existing diagnostics
  local clients = vim.lsp.get_active_clients()
  for _key, client in pairs(clients) do
    vim.lsp.diagnostic.clear(vim.fn.bufnr(), client.id, nil, nil)
  end
end

function enable_buffer()
  -- Remove the current buffer from the disabled buffers table.
  disabled_buffers[vim.fn.bufnr()] = nil

  -- Cheat and write the file to trigger a `publishDiagnostics` event.
  vim.cmd('write')
end

return M
