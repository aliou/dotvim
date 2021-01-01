local map = require('cstm.util').map

-- Globally enable diagnostics.
vim.g.lsp_diagnostics_enabled = true
vim.g.lsp_diagnostics_update_in_insert_enabled = true

-- Configure virtual text colors.
vim.highlight.create('LspDiagnosticsVirtualTextError', { cterm = 'bold', ctermfg = 167, gui = 'bold', guifg = '#CC6666' })
vim.highlight.create('LspDiagnosticsVirtualTextWarning', { ctermfg = 173, gui = 'bold', guifg = '#de935f' })
vim.highlight.create('LspDiagnosticsVirtualTextInformation', { cterm = 'bold', ctermfg = 60, gui = 'bold', guifg = '#5F5F87' })
vim.highlight.create('LspDiagnosticsVirtualTextHint', { cterm = 'bold', ctermfg = 173, gui = 'bold', guifg = '#c7915b' })

local on_attach = function(_)
  -- Setup local diagnostics toggles.
  vim.b.lsp_diagnostics_enabled = true
  vim.b.lsp_diagnostics_update_in_insert_enabled = true

  -- Navigate around warnings / errors.
  map("n", "[a", "<cmd>silent lua vim.lsp.diagnostic.goto_prev({ wrap = false })<cr>")
  map("n", "]a", "<cmd>silent lua vim.lsp.diagnostic.goto_next({ wrap = false })<cr>")

  -- Toggle diagnostics for current buffer.
  map("n", "<leader>at", "<cmd>lua require('cstm.buffer.diagnostic').toggle()<cr>")
end

return {
  on_attach = on_attach
}
