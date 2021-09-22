local util = require('vim.lsp.util')
local fzf = require('fzf')

local go_to_symbol = function(action, symbol)
  local filename = symbol.filename
  local row = symbol.lnum
  local col = symbol.col - 1

  local edit_command = fzf.actions[action] or 'edit'
  local command = string.format(':%s %s', edit_command, filename)

  vim.cmd(command)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

local build_sink = function(symbols)
  local curried_handler = function(response)
    local action = response[1]
    local selected_line = response[2]
    if selected_line == "" then return end

    local idx = tonumber(vim.split(selected_line, '.', true)[1])
    local symbol = symbols[idx]
    go_to_symbol(action, symbol)
  end

  return curried_handler
end

local handler = function(_, result, ctx)
  if not result or vim.tbl_isempty(result) then return end

  local symbols = util.symbols_to_items(result, ctx.bufnr)
  local items = {}

  for idx, symbol in ipairs(symbols) do
    table.insert(items, idx .. '. ' .. symbol.text)
  end

  local pre_options = {
    source = items,
    options = '--reverse --select-1',
    window = { width = 0.6, height = 0.5 },
  }

  local options = fzf.wrap('lsp/workspace_symbol', pre_options)
  options['sink*'] = build_sink(symbols)

  fzf.run(options)
end

vim.lsp.handlers['workspace/symbol'] = handler
