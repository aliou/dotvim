local null_ls = require('null-ls')

-- Register custom code actions.
require('ad.lsp.server.null_ls.go')
require('ad.lsp.server.null_ls.ruby')
require('ad.lsp.server.null_ls.shared')

local jq = require('ad.lsp.server.null_ls.jq')
local rubocop = require('ad.lsp.server.null_ls.rubocop')

local sources = {
  null_ls.builtins.formatting.trim_whitespace.with({
    -- Remove filetypes who already remove whitespace when formatting.
    disabled_filetypes = { "go" },
  }),
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.code_actions.shellcheck,

  jq.formatter,
  rubocop.diagnostic,
}

local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end

  null_ls.setup({
    on_attach = on_local_attach,
    sources = sources,
  })
end

return {
  setup = setup
}