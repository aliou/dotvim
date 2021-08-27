require('cstm.lsp.fallback')
local status = require('cstm.status')

-- Require custom LSP handlers.
require('cstm.lsp.handlers')

-- Configure LSP features when attaching a client to a buffer.
local on_attach = function(client)
  -- Configuration of capabilities.
  require('cstm.lsp.code_action').on_attach(client)
  require('cstm.lsp.definition').on_attach(client)
  require('cstm.lsp.diagnostic').on_attach(client)
  require('cstm.lsp.format').on_attach(client)
  require('cstm.lsp.hover').on_attach(client)
  require('cstm.lsp.references').on_attach(client)
  require('cstm.lsp.rename').on_attach(client)
  require('cstm.lsp.workspace_symbol').on_attach(client)

  -- Configuration of additional capabilities.
  require('cstm.lsp.inlay_hints').on_attach(client)

  -- Refresh status line to display diagnostic progress.
  status.refresh()

  print("lsp: Attaching to client " .. client.name)
end

-- Pass custom capabilities to each server. Currently, we only overide
-- completion cabilities to enable them all.
-- For other capabilities, we configure them in a case by case basis in the
-- files above mainly depending on the LSP server or on the filetype of the
-- buffer where the LSP client is being attached to.
local capabilities = require('cstm.lsp.completion')

-- Configure LSP servers.
-- Each server is configured in its own file and uses the `on_attach` function
-- above.
local servers = {
  'efm',
  'golangci',
  'gopls',
  'rust_analyzer',
  'solargraph',
  'sumneko_lua',
  'tsserver',
  'vimls',
}


for i = 1, #servers do
  local module = 'cstm.lsp.server.' .. servers[i]
  require(module).setup(on_attach, capabilities)
end
