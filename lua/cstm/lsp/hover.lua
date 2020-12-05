local util = require('vim.lsp.util')

-- Note: This is directly copied from the default handler for
-- 'textDocument/hover'.
-- At some point, update it to directly focus the window and to add mappings to
-- quickly close the window or go to other definitions (like calling `K` in
-- vim's help).
local hover_handler = function(_, method, result)
  util.focusable_float(method, function()
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- return { 'No information available' }
      return
    end
    local bufnr, winnr = util.fancy_floating_markdown(markdown_lines, {
      pad_left = 1; pad_right = 1;
    })
    util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, winnr)
    return bufnr, winnr
  end)
end

-- vim.lsp.handlers['textDocument/hover'] = hover_handler
