local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities, custom_config)
  local default_config = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  local config = vim.tbl_extend("error", default_config, custom_config or {})

  nvim_lsp.graphql.setup(config)
end

return { setup = setup }
