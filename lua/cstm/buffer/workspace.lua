local on_submit = function(input)
  vim.lsp.buf.workspace_symbol(input)
end

local symbol = function(query)
  if query and #query ~= 0 then
    return on_submit(query)
  end

  local opts = { prompt = "[Symbol]", }
  vim.ui.input(opts, on_submit)
end

return {
  symbol = symbol
}
