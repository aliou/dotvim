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
vim.cmd [[ augroup ad.diagnostic ]]
vim.cmd [[   autocmd! ]]
vim.cmd [[   autocmd BufRead * lua require('ad.diagnostic.status').setup() ]]
vim.cmd [[   autocmd DiagnosticChanged * lua require('ad.diagnostic.status').refresh_status() ]]
vim.cmd [[ augroup END ]]

return {
  setup = setup,
  refresh_status = refresh_status,
}
