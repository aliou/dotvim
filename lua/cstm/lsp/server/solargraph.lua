local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  local on_local_attach = function(client, bufnr)
    -- Remove formatting capabilities to let efm handle it.
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end

  nvim_lsp.solargraph.setup({
    on_attach = on_local_attach,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

return { setup = setup }
