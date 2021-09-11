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

local goto_next = function()
  vim.lsp.diagnostic.goto_next({
    wrap = true,
    severity_limit = vim.b.lsp_diagnostics_goto_severity_limit
  })
end

local goto_prev = function()
  vim.lsp.diagnostic.goto_prev({
    wrap = true,
    severity_limit = vim.b.lsp_diagnostics_goto_severity_limit
  })
end

return {
  toggle = toggle,
  next = goto_next,
  prev = goto_prev,
}
