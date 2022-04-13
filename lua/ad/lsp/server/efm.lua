local nvim_lsp = require('lspconfig')

local eslint = require('ad.lsp.server.efm.eslint')
local rubocop = require('ad.lsp.server.efm.rubocop')
local vint = require('ad.lsp.server.efm.vint')

local cmd = { "efm-langserver", "-logfile", "/Users/alioudiallo/.local/share/nvim/efm.log", "-loglevel", "3" }

local setup = function(on_attach, capabilities)
  local on_local_attach = function(client, bufnr)
    client.resolved_capabilities.goto_definition = false
    on_attach(client, bufnr)
  end

  nvim_lsp.efm.setup({
    on_attach = on_local_attach,
    capabilities = capabilities,
    cmd = cmd,
    filetypes = { 'ruby', 'javascript' },
    init_options = { documentFormatting = true },
    settings = {
      languages = {
        javascript = { eslint },

        ruby = { rubocop },
        vim = { vint },
      }
    }
  })
end

return {
  setup = setup
}
