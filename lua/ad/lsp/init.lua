require('ad.lsp.fallback')
require('ad.lsp.glance')

-- Require custom LSP handlers.
require('ad.lsp.handlers.format')

require('mason').setup()

-- Configure LSP features when attaching a client to a buffer.
local on_attach = function(client)
  -- Configuration of capabilities.
  require('ad.lsp.code_action').on_attach(client)
  require('ad.lsp.definition').on_attach(client)
  require('ad.lsp.format').on_attach(client)
  require('ad.lsp.hover').on_attach(client)
  require('ad.lsp.references').on_attach(client)
  require('ad.lsp.rename').on_attach(client)
  require('ad.lsp.workspace_symbol').on_attach(client)

  -- TODO: Add mapping (<leader>ls) to display menu for all LSP actions.

  vim.notify("Attaching to client " .. client.name, vim.log.levels.DEBUG, { prefix = "ad.lsp" })
end

-- Pass custom capabilities to each server. Currently, we only overide
-- completion cabilities to enable them all.
-- For other capabilities, we configure them in a case by case basis in the
-- files above mainly depending on the LSP server or on the filetype of the
-- buffer where the LSP client is being attached to.
local capabilities = require('ad.lsp.completion').capabilities

-- Configure LSP servers.
-- Each server is configured in its own file and uses the `on_attach` function
-- above.
local servers = {
  'golangci',
  'gopls',
  'null_ls',
  'rust_tools',
  'solargraph',
  'sourcekit',
  'sumneko_lua',
  'terraformls',
  'tsserver',
  'vimls',
}

for i = 1, #servers do
  local module = 'ad.lsp.server.' .. servers[i]
  require(module).setup(on_attach, capabilities)
end
