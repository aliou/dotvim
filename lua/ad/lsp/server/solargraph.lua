local nvim_lsp = require('lspconfig')

local publish_diagnostics_handler = function(_, _, _, _)
  vim.notify_once('Ignored diagnostic from solagraph server', vim.log.levels.INFO, { prefix = { "ad.lsp" } })
end

-- TODO: At some point, investigate if we can speed up the server by always have
-- it running instead of starting it often (similar to what
-- rubocop-deamon does).
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
    -- NOTE: Custom settings are configued here but seem to be completely
    -- ignored by either nvim or by solargraph. To correctly customize the
    -- differnt capabilities we want to use, we therefore use the
    -- `on_local_attach` function and the custom handler.
    settings = {
      solargraph = {
        -- Disable diagnostics and formatting as efm + rubocop-deamon-wrapper
        -- handles those.
        diagnostics = false,
        formatting = false,
        autoformat = false,

        -- Disable goto_definition as bundle-ctags will handle it.
        definitions = false,
      }
    },
    flags = {
      debounce_text_changes = 150,
    }
  })
end

return { setup = setup }
