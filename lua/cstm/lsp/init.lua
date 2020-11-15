-- nvim_lsp object
local nvim_lsp = require('lspconfig')

-- Configure completion with the LSP client.
local on_attach = function(client)
  require('completion').on_attach(client)
end

-- Enable LSP servers.
nvim_lsp.rust_analyzer.setup({ on_attach = on_attach })
nvim_lsp.solargraph.setup({ on_attach = on_attach })
nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },
})
nvim_lsp.tsserver.setup({ on_attach = on_attach })
nvim_lsp.vimls.setup({ on_attach = on_attach })