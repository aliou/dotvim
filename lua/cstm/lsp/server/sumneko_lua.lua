local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
      }
    },
  })
end

return { setup = setup }
