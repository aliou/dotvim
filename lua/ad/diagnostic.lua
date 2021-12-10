local gnmap = require('cstm.util').gnmap

local next = function()
  vim.diagnostic.goto_next({ wrap = true })
end

local prev = function()
  vim.diagnostic.goto_prev({ wrap = true })
end

-- TODO: Add ignore list, including schema.rb file.
local setup = function()
  vim.b.diagnostic_displayed = true
end

local toggle = function()
  if vim.b.diagnostic_displayed then
    vim.diagnostic.hide(nil, 0)
  else
    vim.diagnostic.show(nil, 0)
  end

  vim.b.diagnostic_displayed = not vim.b.diagnostic_displayed
end

-- Navigate around errors or warnings.
gnmap("[a", "<cmd>lua require('ad.diagnostic').prev()<cr>")
gnmap("]a", "<cmd>lua require('ad.diagnostic').next()<cr>")

-- Quicky toggle diagnostics in the current buffer.
gnmap("<leader>at", "<cmd>lua require('ad.diagnostic').toggle()<cr>")

-- Setup diagnostics default values.
-- Can be overriden in vimrc.local files by clearing the autocmd augroup.
vim.cmd [[ augroup ad.diagnostic ]]
vim.cmd [[   autocmd! ]]
vim.cmd [[   autocmd BufNew * :lua require('ad.diagnostic').setup() ]]
vim.cmd [[ augroup END ]]

return {
  next = next,
  prev = prev,
  setup = setup,
  toggle = toggle,
}
