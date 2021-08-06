local organize_imports = function()
  local context = {
    only = { vim.lsp.protocol.CodeActionKind.SourceOrganizeImports }
  }
  vim.lsp.buf.code_action(context)
end

local format_and_organize_imports = function()
  vim.lsp.buf.formatting_sync()
  organize_imports()
end

return {
  format_and_organize_imports = format_and_organize_imports,
  organize_imports = organize_imports,
}
