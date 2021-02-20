local nvim_lsp = require('lspconfig')

local setup = function(on_attach)
  nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    cmd = {"lua-language-server"},
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { "vim", "unpack", "use" },
        },
        workspace = {
          -- Make the server aware of nvim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    }
  })
end

return { setup = setup }
