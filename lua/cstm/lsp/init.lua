-- Configure LSP features when attaching a client to a buffer.
local on_attach = function(client)
  -- TODO: require outside of on attach function ? Check if lua caches requires
  -- or not.
  require('cstm.lsp.code_action').on_attach(client)
  require('cstm.lsp.completion').on_attach(client)
  require('cstm.lsp.definition').on_attach(client)
  require('cstm.lsp.diagnostic').on_attach(client)
  require('cstm.lsp.format').on_attach(client)
  require('cstm.lsp.hover').on_attach(client)
  require('cstm.lsp.inlay_hints').on_attach(client)
  require('cstm.lsp.rename').on_attach(client)
end

-- Configure LSP servers.
-- Each server is configured in its own file and uses the `on_attach` function
-- above.
local servers = {
  'rust_analyzer', 'solargraph', 'sumneko_lua', 'tsserver', 'vimls'
}
for i = 1, #servers do
  local module = 'cstm.lsp.server.' .. servers[i]
  require(module).setup(on_attach)
end

-- Load custom responses to LSP servers.
local custom_handlers = { 'code_action', 'diagnostic', 'hover' }
for i = 1, #custom_handlers do
  local module = 'cstm.lsp.handlers.' .. custom_handlers[i]
  require(module)
end
