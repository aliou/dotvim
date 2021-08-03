local organize_imports = function()
  local context = {
    only = { vim.lsp.protocol.CodeActionKind.SourceOrganizeImports }
  }
  vim.lsp.buf.code_action(context)
end

return {
  organize_imports = organize_imports
}
