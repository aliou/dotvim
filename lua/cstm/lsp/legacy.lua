local map = require('cstm.util').map
-- We setup global maps that will be overriden for each buffer when attaching to
-- a LSP client.

local on_buf_enter = function()
  map("n", "<leader>ca", "<nop>")

  map("n", "<leader>ct", "<nop>")

  map("n", "[a", "<nop>")
  map("n", "]a", "<nop>")
  map("n", "<leader>at", "<nop>")

  map("n", "<leader>af", "<nop>")
  map('n', '<leader>ht', "<nop>")
  map("n", "<leader>lr", "<nop>")
  map("n", "<leader>rn", "<nop>")
end

vim.api.nvim_exec([[
  augroup lsp.fallback_maps
    autocmd!

    autocmd BufEnter * lua require('cstm.lsp.legacy').on_buf_enter()
  augroup END
]], true)


return {
  on_buf_enter = on_buf_enter
}
