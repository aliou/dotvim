local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = {'golangci-lint-langserver'},
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
      }
    };
  }
end

local setup = function(on_attach, capabilities)
  configs.golangcilsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {'go'}
  })
end


return { setup = setup }
