local null_ls = require('null-ls')

-- Register custom code actions.
require('ad.lsp.server.null_ls.go')
require('ad.lsp.server.null_ls.ruby')

local jq = require('ad.lsp.server.null_ls.jq')
local rubocop = require('ad.lsp.server.null_ls.rubocop')

-- TODO: Dynamic sources? Per project sources?
local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.swiftformat.with({
    extra_args = { "--indentcase", "true" }
  }),
  null_ls.builtins.formatting.trim_whitespace,
  null_ls.builtins.formatting.xmllint,

  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.golangci_lint,
  null_ls.builtins.diagnostics.shellcheck,

  null_ls.builtins.code_actions.eslint_d,
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

    -- Disable when inside a node_modules directory.
    local full_path = vim.fn.expand('%:p')
    if full_path:match("node_modules") then
      vim.notify("lsp: skipping attach because file is in node_modules directory", vim.log.levels.DEBUG)
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
