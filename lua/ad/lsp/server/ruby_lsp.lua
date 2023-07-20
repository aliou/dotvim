local nvim_lsp = require('lspconfig')


local setup = function(on_attach, capabilities)
  nvim_lsp.ruby_ls.setup({
    -- cmd = { "bundle", "exec", "ruby_ls" },
    capabilities = capabilities,
    on_attach = function(client, buffer)
      pcall(on_attach, client, buffer)

      local diagnostic_handler = function()
        local params = vim.lsp.util.make_text_document_params(buffer)
        client.request(
          'textDocument/diagnostic',
          { textDocument = params },
          function(err, result)
            if err then
              local err_msg = string.format("ruby-lsp - diagnostics error - %s", vim.inspect(err))
              vim.lsp.log.error(err_msg)
            end

            if not result then return end

            vim.lsp.diagnostic.on_publish_diagnostics(
              nil,
              vim.tbl_extend('keep', params, { diagnostics = result.items }),
              { client_id = client.id }
            )
          end
        )
      end

      diagnostic_handler() -- to request diagnostics when attaching the client to the buffer

      local ruby_group = vim.api.nvim_create_augroup('ruby_ls', { clear = false })
      vim.api.nvim_create_autocmd(
        { 'BufEnter', 'BufWritePre', 'InsertLeave', 'TextChanged' },
        {
          buffer = buffer,
          callback = diagnostic_handler,
          group = ruby_group,
        }
      )
    end
  })
end

return { setup = setup }
