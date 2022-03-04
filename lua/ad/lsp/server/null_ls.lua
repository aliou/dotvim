local null_ls = require('null-ls')
-- local ruby_code_actions = require('ad.lsp.server.null_ls.ruby_code_actions')

-- Register ruby code actions.
require('ad.lsp.server.null_ls.ruby_code_actions')

local jq = require('ad.lsp.server.null_ls.jq')
local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end

  null_ls.setup({
    on_attach = on_local_attach,
    sources = {
      jq,
      -- ruby_code_actions.begin_rescue_block,
      -- ruby_code_actions.binding_pry,
      -- ruby_code_actions.frozen_string_actions,
    },
  })
end

return {
  setup = setup
}
