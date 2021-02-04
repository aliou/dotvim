-- Delegate to lightline for now.
local refresh = vim.fn['lightline#update']

local in_progress = '⋯'
local failure = '✗'
local success = '✓'

local set_status = function(status)
  vim.b.status_value = status
  refresh()
end

return {
  refresh = refresh,
  set_status = set_status,

  in_progress = in_progress,
  failure = failure,
  success = success,
}
