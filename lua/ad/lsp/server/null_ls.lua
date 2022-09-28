local null_ls = require('null-ls')
local command_resolver = require("null-ls.helpers.command_resolver")

-- Register custom code actions.
require('ad.lsp.server.null_ls.go')
require('ad.lsp.server.null_ls.ruby')
require('ad.lsp.server.null_ls.shared')

local jq = require('ad.lsp.server.null_ls.jq')
local rubocop = require('ad.lsp.server.null_ls.rubocop')

local yarn_overrides = {
  dynamic_command = function(params)
    return command_resolver.from_yarn_pnp(params)
      or command_resolver.from_node_modules(params)
      or vim.fn.executable(params.command) == 1 and params.command
  end,
}

local node_ignored_errors = {
  "(node:27554)",
  "(node:26482)",
  "(node:29712)"
}

local eslint_overrides = {
  dynamic_command = yarn_overrides.dynamic_command,
  filter = function(diagnostic)
    for _, prefix in ipairs(node_ignored_errors) do
      if vim.startswith(diagnostic.message, prefix) then
        return false
      end
    end

    return true
  end
}

local sources = {
  null_ls.builtins.formatting.prettier.with(yarn_overrides),
  null_ls.builtins.formatting.trim_whitespace.with({
    -- Remove filetypes who already remove whitespace when formatting.
    disabled_filetypes = { "go" },
  }),

  null_ls.builtins.diagnostics.eslint.with(eslint_overrides),
  null_ls.builtins.diagnostics.golangci_lint,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.vint,

  null_ls.builtins.code_actions.eslint.with(yarn_overrides),
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
