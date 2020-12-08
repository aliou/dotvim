-- Configure completion with the LSP client.
local on_attach = function(client)
  require('cstm.lsp.inlay_hints').on_attach(client)
  require('cstm.lsp.completion').on_attach(client)
end

-- Enable LSP servers.
-- Each server is configured in its own file and uses the `on_attach` function
-- above.
local servers = {
  'rust_analyzer',
  'solargraph',
  'sumneko_lua',
  'tsserver',
  'vimls',
}

for i = 1, #servers do
  local module = 'cstm.lsp.server.' .. servers[i]
  require(module).setup(on_attach)
end
