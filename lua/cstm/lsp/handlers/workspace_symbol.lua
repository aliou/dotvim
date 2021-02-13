local util = require('vim.lsp.util')

local handler =  function(_, _, result, _, bufnr)
  if not result or vim.tbl_isempty(result) then return end

  local symbols = util.symbols_to_items(result, bufnr)
  local items = {}

  for idx, symbol in ipairs(symbols) do
    table.insert(items, idx .. '. ' .. symbol.text)
  end

  local pre_options = {
    source = items,
    options = '--reverse --select-1',
    window = { width = 0.6, height = 0.5 },
  }

  local options = vim.fn['fzf#wrap']('lsp/workspace_symbol', pre_options)

  options["sink*"] = nil
  options.sink = function(selected_line)
    if selected_line == "" then return end

    local idx = tonumber(vim.split(selected_line, '.', true)[1])
    local symbol = symbols[idx]
  end

  vim.fn['fzf#run'](options)
end

vim.lsp.handlers['workspace/symbol'] = handler
