local map = require('cstm.util').map
local get_buf_filetypes = require('cstm.util').get_buf_filetypes

local SKIPPED_FILETYPES = {'ruby'}
local is_skipped_filetype = function(ft)
  return vim.tbl_contains(SKIPPED_FILETYPES, ft)
end


local on_attach = function(_)
  -- Fallback to the default behaviour (ctags) for definition in Ruby.
  local buf_fts = get_buf_filetypes()
  local has_skipped_filter = not vim.tbl_isempty(vim.tbl_filter(is_skipped_filetype, buf_fts))

  if has_skipped_filter then return end

  map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
end

return {
  on_attach = on_attach
}
