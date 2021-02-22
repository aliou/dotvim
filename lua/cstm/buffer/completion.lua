local compe = require('compe')
local map = require('cstm.util')

local enable = function()
  compe.setup({ enabled = true }, 0)
end

local disable = function()
  compe.setup({ enabled = false }, 0)
end

-- TODO: Add toggle map.
map("n", "<leader>cd", "<cmd> lua require('cstm.buffer.completion').disable()<cr>", { buffer = false })
map("n", "<leader>ce", "<cmd> lua require('cstm.buffer.completion').disable()<cr>", { buffer = false })

return {
  disable = disable,
  enable = enable
}
