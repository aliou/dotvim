local bd = require('cstm.buffer.diagnostic')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Display diagnostics in virtual text.
    -- TODO: Define custom Highlight groups:
    --   LspDiagnosticsVirtualTextError
    --   LspDiagnosticsVirtualTextWarning
    --   LspDiagnosticsVirtualTextInformation
    --   LspDiagnosticsVirtualTextHint
    virtual_text = function(bufnr, _client_id)
      if bd.is_disabled(bufnr) then
        return false
      end

      return { spacing = 4 }
    end,

    -- Wait for InsertLeave before displaying diagnostics.
    update_in_insert = false,

    -- NOTE: Defining defaults here to quickly test them.
    underline = true,
    signs = true,
  }
)
