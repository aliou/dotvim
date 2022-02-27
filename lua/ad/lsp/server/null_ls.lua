local null_ls = require('null-ls')
local jq = require('ad.lsp.server.null_ls.jq')

local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end

  null_ls.setup({
    on_attach = on_local_attach,
    sources = {
      jq
    },
  })
end

return {
  setup = setup
}
