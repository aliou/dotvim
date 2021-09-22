local nvim_lsp = require('lspconfig')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

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
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          enable = true,
          globals = { "vim", "unpack", "use", "P",  "RELOAD", "R" },
        },
        workspace = {
          -- Make the server aware of nvim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  })
end

return { setup = setup }
