local ts = require("typescript-tools")
local api = require("typescript-tools.api")

local update_imports = function()
  api.remove_unused_imports(true)
  api.add_missing_imports(true)
end

local go_to_source_definition = function()
  api.go_to_source_definition(true)
end

local setup = function(on_attach)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)

    -- Remove formatting capabilities to let eslint / prettier handle everything related to
    -- formatting.
    client.server_capabilities.documentFormattingProvider = nil

    vim.keymap.set('n', '<leader>li', update_imports, { desc = "[lsp/ts] add missing imports", buffer = true })
    vim.keymap.set('n', '<C-]>', go_to_source_definition, { desc = "[lsp/ts] go to definition", buffer = true })
  end

  ts.setup({
    on_attach = on_local_attach,
    single_file_support = false,
    settings = {
      tsserver_file_preferences = {
        quotePreference = 'single', -- TODO: Try to have this be a project based conf.
        includeInlayParameterNameHints = 'all',
      },
      tsserver_format_options = {
        insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
      },
    },
  })
end

return {
  setup = setup,
}
