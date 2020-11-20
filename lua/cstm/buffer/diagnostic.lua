local function disable()
  vim.b.lsp_diagnostics_enabled = false

  -- Clear existing diagnostics
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    vim.lsp.diagnostic.clear(vim.fn.bufnr(), client.id, nil, nil)
  end
end

local function enable()
  vim.b.lsp_diagnostics_enabled = true

  -- Cheat and reload the file to trigger a `publishDiagnostics` event.
  -- TODO: Find a way to actually reload the thing :(
  vim.cmd('edit')
end

local function toggle()
  if vim.b.lsp_diagnostics_enabled then
    disable()
  else
    enable()
  end
end

return {
  toggle = toggle,
}
