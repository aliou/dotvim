local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities, custom_config)
  local on_init = function (_, _)
    -- Try to setup handler for formatting (using fixall)
  end

  local local_on_attach = function (client, buffer)
    client.server_capabilities.documentFormattingProvider = true
    pcall(on_attach, client, buffer)
  end

  local default_config = {
    capabilities = capabilities,
    on_init = on_init,
    on_attach = local_on_attach,
  }
  local config = vim.tbl_extend("error", default_config, custom_config or {})

  nvim_lsp.eslint.setup(config)
end

return {
  setup = setup
}
