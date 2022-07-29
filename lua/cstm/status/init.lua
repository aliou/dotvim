-- Delegate to lightline for now.
local refresh = vim.fn['lightline#update']

local in_progress = '⋯'
local failure = '✗'
local success = '✓'

local set_status = function(status)
  vim.b.status_value = status
  refresh()
end

local highlight = function(buf)
  buf = buf or 0

  if vim.b[buf].status_value == in_progress then return nil end
  if vim.b[buf].status_value == failure then return 'DiagnosticError' end
  if vim.b[buf].status_value == success then return 'DiagnosticSuccess' end

  return nil
end

return {
  refresh = refresh,
  set_status = set_status,
  highlight = highlight,

  in_progress = in_progress,
  failure = failure,
  success = success,
}
