-- Delegate to lightline for now.
local refresh = vim.fn['lightline#update']

return {
  refresh = refresh
}
