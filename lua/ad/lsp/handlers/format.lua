local apply_format = function(_, result, ctx, _)
  if not result or result == 0 then return end

  local client = vim.lsp.get_client_by_id(ctx.client_id)

  -- To not have the formatting update be too jarring, save and restore the view
  -- of the current window around the application of the formatting.
  local view = vim.fn.winsaveview()
  vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
  vim.fn.winrestview(view)

  -- Write changes witout triggering autocommands.
  vim.cmd("noautocmd :update")
end

vim.lsp.handlers['textDocument/rangeFormatting'] = apply_format
vim.lsp.handlers['textDocument/formatting'] = apply_format
