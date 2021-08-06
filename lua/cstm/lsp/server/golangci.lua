local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

if not lspconfig.golangcilsp then
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

local setup = function(on_attach)
  lspconfig.golangcilsp.setup {
    on_attach = on_attach,
    filetypes = {'go'}
  }
end


return { setup = setup }
