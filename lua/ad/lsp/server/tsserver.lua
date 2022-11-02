local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  local on_local_attach = function(client, bufnr)
    -- Remove formatting capabilities to let eslint handle it.
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end

  nvim_lsp.tsserver.setup({ on_attach = on_local_attach })
end

return { setup = setup }
