local nvim_lsp = require('lspconfig')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local playdate_globals = {"playdate", "import"}

local setup = function(on_attach, capabilities)
  local on_init = function(client, _)
    if vim.b.lua_context == "playdate" then
      -- TODO: Only do all of this configuration if the SDK is found.
      client.config.settings.Lua.workspace.library = vim.fn.expand("$PLAYDATE_SDK_PATH/CoreLibs")

      for _, g in ipairs(playdate_globals) do
        table.insert(client.config.settings.Lua.diagnostics.globals, g)
      end
      client.config.settings.Lua.runtime.version = 'Lua 5.4'
      client.config.settings.Lua.runtime.nonstandardSymbol = { "+=", "-=", "*=", "/=" }
    end

    if vim.b.lua_context == "vim" then
      table.insert(client.config.settings.Lua.diagnostics.globals, "vim")
      -- TODO: setup library, see value below.
    end

    P(client.config.settings.Lua.diagnostics)
  end

  nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    on_init = on_init,
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
          globals = { "unpack", "use", "P",  "RELOAD", "R" },
        },
        format = {
          enable = true,
          indent_style = "space",
          indent_size = "2",
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
