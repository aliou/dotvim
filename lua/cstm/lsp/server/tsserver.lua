local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  nvim_lsp.tsserver.setup({ on_attach = on_attach })
end

return { setup = setup }
