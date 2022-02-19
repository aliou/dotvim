local nvim_lsp = require('lspconfig')

local publish_diagnostics_handler = function(_, _, _, _)
  vim.notify_once('Ignored diagnostic from solagraph server', vim.log.levels.INFO, { prefix = { "ad.lsp" } })
end

local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    -- Remove formatting capabilities to let efm handle it.
    client.resolved_capabilities.document_formatting = false

    -- Remove goto_definition capabilities and let ctags handle it.
    client.resolved_capabilities.goto_definition = false

    on_attach(client, bufnr)
  end

  nvim_lsp.solargraph.setup({
    on_attach = on_local_attach,
    handlers = {
      ['textDocument/publishDiagnostics'] = publish_diagnostics_handler,
    },
    flags = {
      debounce_text_changes = 150,
    }
  })
end

return { setup = setup }
