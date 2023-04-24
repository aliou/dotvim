local ts = require("typescript")

local update_imports = function()
  ts.actions.addMissingImports({ sync = true })
  ts.actions.removeUnused({ sync = true })
end

local go_to_source_definition = function()
  local winnr = vim.fn.winnr()
  ts.actions.goToSourceDefinition(winnr, { fallback = true })
end

local setup = function(on_attach)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.keymap.set('n', '<leader>li', update_imports, { desc = "[lsp/ts] add missing imports", buffer = true })
    -- the action is only available for tsserver > 4.7
    if ts.actions.goToSourceDefinition ~= nil then
      vim.keymap.set('n', '<C-]>', go_to_source_definition, { desc = "[lsp] go to definition", buffer = true })
    end
  end

  ts.setup({
    disable_commands = false,
    server = {
      on_attach = on_local_attach,
    }
  })
end

return { setup = setup }
