local function virtual_text(_, _)
  return vim.b.lsp_diagnostics_enabled and { spacing = 4 }
end

local function buffer_diagnostics_enabled(_, _)
  return vim.b.lsp_diagnostics_enabled
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Display diagnostics in virtual text.
    -- TODO: Define custom Highlight groups:
    --   LspDiagnosticsVirtualTextError
    --   LspDiagnosticsVirtualTextWarning
    --   LspDiagnosticsVirtualTextInformation
    --   LspDiagnosticsVirtualTextHint
    virtual_text = function(bufnr, client_id)
      return virtual_text(bufnr, client_id)
    end,

    update_in_insert = function(_, _)
      return vim.b.lsp_diagnostics_enabled and
             vim.b.lsp_diagnostics_update_in_insert_enabled
    end,

    -- Enable / Disable the diagnostics depending on
    -- `b:lsp_diagnostics_enabled`.
    underline = buffer_diagnostics_enabled,
    signs = buffer_diagnostics_enabled,
  }
)
