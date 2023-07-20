local nvim_lsp = require('lspconfig')

-- TODO:
-- * Figure out diff between workspace.library and runtime.path
-- * is the notification useful and required?
-- * figure out formatting (if options below are used or not)
local setup = function(on_attach, capabilities)
  local on_init = function(client, _)
    if vim.b.lua_context == "playdate" then
      client.config.settings.Lua.workspace.library = vim.fn.expand("$PLAYDATE_SDK_PATH/CoreLibs")

      client.config.settings.Lua.diagnostics.globals = { "playdate", "import" }

      client.config.settings.Lua.runtime.version = 'Lua 5.4'
      client.config.settings.Lua.runtime.nonstandardSymbol = { "+=", "-=", "*=", "/=" }
    end

    if vim.b.lua_context == "vim" then
      client.config.settings.Lua.diagnostics.globals = { "unpack", "use", "P", "RELOAD", "R", "vim" }
      table.insert(client.config.settings.Lua.diagnostics.globals, "vim")

      client.config.settings.Lua.workspace.library = vim.api.nvim_get_runtime_file('', true)
    end

    client.notify("workspace/didChangeConfiguration")
    vim.notify(vim.inspect(client.config.settings.Lua.diagnostics), vim.log.levels.DEBUG)
  end

  nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {"lua-language-server"},
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.g.lua_path, -- TODO: Does it make sense for non vim projects?
        },
        diagnostics = {
          enable = true,
          globals = {}, -- Overriden on init.
        },
        format = {
          enable = true,
          indent_style = "space",
          indent_size = "2",
        },
        workspace = {}, -- Overriden on init.
        telemetry = {
          enable = false,
        },
      },
    }
  })
end

return { setup = setup }
