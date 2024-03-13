local on_attach = function(client, _)
  -- if client.server_capabilities.inlayHintProvider then
  --   vim.lsp.buf.inlay_hint(0, true)
  -- end
end

return {
  on_attach = on_attach
}
