local null_ls = require('null-ls')

local setup = function(on_attach, _)
  local on_local_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end

  null_ls.setup({
    on_attach = on_local_attach,
    sources = {
    },
  })
end

return {
  setup = setup
}
