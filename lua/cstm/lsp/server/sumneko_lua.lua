local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities)
  local on_local_attach = function(client, bufnr)
    -- TODO: Remove some capabilities when this is a vim runtime file.
    on_attach(client, bufnr)
  end

  nvim_lsp.sumneko_lua.setup({
    on_attach = on_local_attach,
    capabilities = capabilities,
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
