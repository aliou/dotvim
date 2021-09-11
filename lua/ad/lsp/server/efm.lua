local nvim_lsp = require('lspconfig')

local eslint = require('ad.lsp.server.efm.eslint')
local jq = require('ad.lsp.server.efm.jq')
local rubocop = require('ad.lsp.server.efm.rubocop')
local shellcheck = require('ad.lsp.server.efm.shellcheck')
local vint = require('ad.lsp.server.efm.vint')

local cmd = { "efm-langserver" }
if vim.g.lsp_efm_log_events then
  cmd = vim.tbl_extend("keep", { "-logfile", "/Users/alioudiallo/.local/share/nvim/efm.log", "-loglevel", "3" })
end

local setup = function(on_attach, capabilities)
  local on_local_attach = function(client, bufnr)
    client.resolved_capabilities.goto_definition = false
    on_attach(client, bufnr)
  end

  nvim_lsp.efm.setup({
    on_attach = on_local_attach,
    capabilities = capabilities,
    cmd = cmd,
    filetypes = { 'ruby', 'json', 'bash', 'sh', 'javascript' },
    init_options = { documentFormatting = true },
    settings = {
      languages = {
        bash = { shellcheck },
        sh = { shellcheck },

        javascript = { eslint },

        json = { jq },
        ruby = { rubocop },
        vim = { vint },
      }
    }
  })
end

return {
  setup = setup
}
