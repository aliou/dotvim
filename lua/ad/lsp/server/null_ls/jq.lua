local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

return h.make_builtin({
  name = "jq",
  method = methods.internal.FORMATTING,
  filetypes = { "json" },
  generator_opts = { command = "jq", args = { "." }, to_stdin = true },
  factory = h.formatter_factory,
})
