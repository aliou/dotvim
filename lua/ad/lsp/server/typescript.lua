local ts = require("typescript-tools")
local api = require("typescript-tools.api")

local update_imports = function()
    api.add_missing_imports()
    api.remove_unused()
end

local go_to_source_definition = function()
    api.go_to_source_definition()
end

local setup = function(on_attach)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.keymap.set('n', '<leader>li', update_imports, { desc = "[lsp/ts] add missing imports", buffer = true })
    vim.keymap.set('n', '<C-]>', go_to_source_definition, { desc = "[lsp] go to definition", buffer = true })
  end

  ts.setup({
    on_attach = on_local_attach,
    settings = {
      expose_as_code_action = { "fix_all", "add_missing_impots", "remove_unused" },
    },
  })
end

return {
  setup = setup,
}
