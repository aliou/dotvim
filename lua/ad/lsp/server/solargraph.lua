local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities)
  local on_local_attach = function(client, bufnr)
    -- Remove formatting capabilities to let efm handle it.
    client.resolved_capabilities.document_formatting = false

    -- Remove goto_definition capabilities and let ctags handle it.
    client.resolved_capabilities.goto_definition = false

    -- TODO: Remove hover to let ri.vim handle documentation.
    on_attach(client, bufnr)
  end

  nvim_lsp.solargraph.setup({
    on_attach = on_local_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

return { setup = setup }