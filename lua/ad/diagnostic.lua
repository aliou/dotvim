local map = require('cstm.util').map

local next = function()
  vim.diagnostic.goto_next({ wrap = true })
end

local prev = function()
  vim.diagnostic.goto_prev({ wrap = true })
end

-- Navigate around errors or warnings.
map("n", "[a", "<cmd>lua require('ad.diagnostic').prev()<cr>", { buffer = false })
map("n", "]a", "<cmd>lua require('ad.diagnostic').next()<cr>", { buffer = false })

-- Setup diagnostics default values.
-- Can be overriden in vimrc.local files.
vim.cmd [[ augroup ad.diagnostic ]]
vim.cmd [[   autocmd! ]]
vim.cmd [[ augroup END ]]

return {
  prev = prev,
  next = next,
}
