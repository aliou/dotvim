-- Setup inlay hints in this file.
-- They seem to only be available with Rust and rust-analyzer, so explicitly
-- check that we're in a Rust buffer.
local on_attach = function(_client)
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'rust' then
    return
  end

  vim.cmd [[
    autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request({ aligned = true, prefix = "» " })
  ]]
end

return {
  on_attach = on_attach
}
