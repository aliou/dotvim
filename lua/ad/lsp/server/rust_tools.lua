local rt = require("rust-tools")

local setup = function(on_attach, capabilities)
  rt.setup({
    tools = {
      inlay_hints = {
        parameter_hints_prefix = "« ",
        other_hints_prefix = "» ",
      },
    },
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      standalone = false,
    },
  })
end

return {
  setup = setup
}
