local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities)
  nvim_lsp.terraformls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

return { setup = setup }
