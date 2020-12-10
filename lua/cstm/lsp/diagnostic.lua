local map = require('cstm.lsp.util').map

-- Globally enable diagnostics.
vim.g.lsp_diagnostics_enabled = true

local on_attach = function(_)
  -- Setup local diagnostics toggles.
  vim.b.lsp_diagnostics_enabled = true
  vim.b.lsp_diagnostics_update_in_insert_enabled = true

  -- Navigate around warnings / errors.
  -- TODO: At some point merge these maps with the error maps from ALE, see
  -- config/plugin/ale/maps.vim
  map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({ wrap = true })<cr>")
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({ wrap = true })<cr>")
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({ wrap = true })<cr>")


  -- Toggle diagnostics for current buffer.
  -- TODO: At some point, also merge this map with the buffer toggle from ALE,
  -- see config/plugin/ale/maps.vim
  map("n", "<leader>dt", "<cmd>lua require('cstm.buffer.diagnostic').toggle()<cr>")
end

return {
  on_attach = on_attach
}
