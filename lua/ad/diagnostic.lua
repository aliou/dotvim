local map = require('cstm.util').map
local status = require('cstm.status')

local gnmap = function(key, result)
  map("n", key, result, { buffer = false })
end

local next = function()
  vim.diagnostic.goto_next({ wrap = true })
end

local prev = function()
  vim.diagnostic.goto_prev({ wrap = true })
end

local setup = function()
  if vim.fn.exists('b:diagnostic_displayed') == 0 then
    vim.b.diagnostic_displayed = true
  end
end

local toggle = function()
  if vim.b.diagnostic_displayed then
    vim.diagnostic.hide(nil, 0)
  else
    vim.diagnostic.show(nil, 0)
  end

  vim.b.diagnostic_displayed = not vim.b.diagnostic_displayed
end

local refresh_status = function()
  local values = vim.diagnostic.get(0, nil)
  if vim.tbl_isempty(values) then
    status.set_status(status.success)
  else
    status.set_status(status.failure)
  end
end

-- Navigate around errors or warnings.
gnmap("[a", "<cmd>lua require('ad.diagnostic').prev()<cr>")
gnmap("]a", "<cmd>lua require('ad.diagnostic').next()<cr>")
gnmap("<leader>at", "<cmd>lua require('ad.diagnostic').toggle()<cr>")

-- Setup diagnostics default values.
-- Can be overriden in vimrc.local files by clearing the autocmd augroup.
vim.cmd [[ augroup ad.diagnostic ]]
vim.cmd [[   autocmd! ]]
vim.cmd [[   autocmd BufRead * lua require('ad.diagnostic').setup() ]]
vim.cmd [[   autocmd DiagnosticChanged * lua require('ad.diagnostic').refresh_status() ]]
vim.cmd [[ augroup END ]]

return {
  next = next,
  prev = prev,
  setup = setup,
  refresh_status = refresh_status,
  toggle = toggle,
}
