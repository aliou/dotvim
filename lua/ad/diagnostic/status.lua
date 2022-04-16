local status = require('cstm.status')

local refresh_status = function()
  local values = vim.diagnostic.get(0, nil)
  if vim.tbl_isempty(values) then
    status.set_status(status.success)
  else
    status.set_status(status.failure)
  end
end

local setup = function()
  if vim.fn.exists('b:diagnostic_displayed') == 0 then
    vim.b.diagnostic_displayed = true
  end

  refresh_status()
end

-- Setup diagnostics default values.
-- Can be overriden in vimrc.local files by clearing the autocmd augroup.
local augroup = vim.api.nvim_create_augroup('ad.diagnostics', { clear = true })

vim.api.nvim_create_autocmd('BufRead', {
  group = augroup, pattern = '*', callback = setup,
  desc = '[diagnostic] Setup diagnostic in buffer',
})

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  group = augroup, pattern = '*', callback = refresh_status,
  desc = '[diagnostic] Update statusline on diagnostic change',
})

return {
  augroup = augroup
}
