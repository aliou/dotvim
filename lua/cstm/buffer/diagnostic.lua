local M = {}

-- Table storing the disabled buffers.
local disabled_buffers = {}

function M.is_disabled(bufnr)
  return disabled_buffers[bufnr] == true
end

function M.toggle()
  _ = M.is_disabled(vim.fn.bufnr()) and M.enable() or M.disable()
end

function M.disable()
  -- Make the current buffer as diagnostics disabled.
  disabled_buffers[vim.fn.bufnr()] = true

  -- Clear existing diagnostics
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    vim.lsp.diagnostic.clear(vim.fn.bufnr(), client.id, nil, nil)
  end
end

function M.enable()
  -- Remove the current buffer from the disabled buffers table.
  disabled_buffers[vim.fn.bufnr()] = nil

  -- Cheat and write the file to trigger a `publishDiagnostics` event.
  -- TODO: Find a way to actually reload the thing :(
  vim.cmd('edit')
end

return M
