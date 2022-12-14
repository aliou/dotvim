local u = require('cstm.util')
local null_ls = require('null-ls')

-- Register custom code actions.
require('ad.lsp.server.null_ls.go')
require('ad.lsp.server.null_ls.ruby')
require('ad.lsp.server.null_ls.shared')

local jq = require('ad.lsp.server.null_ls.jq')
local rubocop = require('ad.lsp.server.null_ls.rubocop')

local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.trim_whitespace.with({
    -- Remove filetypes who already remove whitespace when formatting.
    disabled_filetypes = { "go" },
  }),
  null_ls.builtins.formatting.xmllint,

  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.golangci_lint,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.vint,

  null_ls.builtins.code_actions.eslint,
  null_ls.builtins.code_actions.shellcheck,

  jq.formatter,
  rubocop.diagnostic,
  rubocop.formatting,
}

local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end

  local should_attach = function(bufnr)
    -- Disable null-ls for rust.
    if vim.bo[bufnr].filetype == 'rust' then
      return false
    end

    -- Disable for tmp directories.
    if u.files.is_in_tmp_directory() then
      return false
    end

    return true
  end

  null_ls.setup({
    on_attach = on_local_attach,
    should_attach = should_attach,
    sources = sources,
  })
end

return {
  setup = setup
}
