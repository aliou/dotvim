local setup = function(on_attach, capabilities)
  require('xbase').setup({
      sourcekit = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
      mappings = {
        enable = false
      }
    })
end

return { setup = setup }
