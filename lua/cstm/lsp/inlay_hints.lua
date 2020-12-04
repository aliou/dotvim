local inlay_hints = require('cstm.buffer.inlay_hints')

-- Setup inlay hints in this file.
-- They seem to only be available with Rust and rust-analyzer, so explicitly
-- check that we're in a Rust buffer.
local on_attach = function(_)
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'rust' then
    return
  end

  inlay_hints.enable()
end

return {
  on_attach = on_attach
}
