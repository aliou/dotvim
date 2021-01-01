local map = require('cstm.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.goto_definition then
    return
  end

  -- Fallback to the default behaviour (ctags) for definition.
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'ruby' then
    return
  end

  map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
end

return {
  on_attach = on_attach
}
