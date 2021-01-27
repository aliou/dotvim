local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  nvim_lsp.gopls.setup({
    on_attach = on_attach,
  })
end

return { setup = setup }
