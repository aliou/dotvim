local map = require('cstm.util').map
local protocol = require('vim.lsp.protocol')
local severities = protocol.DiagnosticSeverity

-- TODO: Refactor variables to be named: vim.b.diagnostics and
-- vim.g.diagnostics.
-- Add a function to access the variables easily? (e.g. Ale#Var).

-- Globally enable diagnostics.
vim.g.lsp_diagnostics_enabled = true
vim.g.lsp_diagnostics_update_in_insert_enabled = true

local on_attach = function(_)
  -- Setup local diagnostics toggles.
  vim.b.lsp_diagnostics_enabled = true
  vim.b.lsp_diagnostics_update_in_insert_enabled = true

  -- Allow buffer level configuration of severity limit of the diagnostics to
  -- navigate between. Fallback on allowing all severities.
  vim.b.lsp_diagnostics_goto_severity_limit =
    vim.b.lsp_diagnostics_goto_severity_limit or severities.Hint

  -- Navigate around warnings / errors.
  map("n", "[a", "<cmd>lua require('cstm.buffer.diagnostic').prev()<cr>")
  map("n", "]a", "<cmd>lua require('cstm.buffer.diagnostic').next()<cr>")

  -- Toggle diagnostics for current buffer.
  map("n", "<leader>at", "<cmd>lua require('cstm.buffer.diagnostic').toggle()<cr>")
end

return {
  on_attach = on_attach,
}
