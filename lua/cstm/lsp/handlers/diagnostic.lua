local function buffer_diagnostics_enabled(_, _)
  return vim.g.lsp_diagnostics_enabled and
         vim.b.lsp_diagnostics_enabled
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Display diagnostics in virtual text.
    virtual_text = function(bufnr, client_id)
      return buffer_diagnostics_enabled(bufnr, client_id) and
             { spacing = 4 }
    end,

    update_in_insert = function(bufnr, client_id)
      return buffer_diagnostics_enabled(bufnr, client_id) and
             vim.g.lsp_diagnostics_update_in_insert_enabled and
             vim.b.lsp_diagnostics_update_in_insert_enabled
    end,

    -- Enable / Disable the diagnostics depending on
    -- `b:lsp_diagnostics_enabled`.
    underline = buffer_diagnostics_enabled,
    signs = buffer_diagnostics_enabled,
  }
)
