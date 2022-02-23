local workspace_symbol = function(query)
  local on_submit = function(input)
    local message = string.format("searching for workspace_symbol '%s' ...", input)
    vim.notify(message, vim.log.levels.INFO, { prefix = "ad.lsp" })

    vim.lsp.buf.workspace_symbol(input)
  end

  if query and #query ~= 0 then
    return on_submit(query)
  end

  if query == nil then
    query = vim.fn.expand("<cword>")
  end

  local opts = {
    prompt = "[Symbol]",
    default = query,
  }
  vim.ui.input(opts, on_submit)
end


local on_attach = function(client, _)
  if not client.resolved_capabilities.workspace_symbol then return end

  vim.keymap.set('n', '<leader>ll', workspace_symbol, { desc = "[lsp] workspace symbol", buffer = true })
end

return {
  on_attach = on_attach
}
