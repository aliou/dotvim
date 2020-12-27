local map = require('cstm.lsp.util').map

local on_attach = function(client)
  if not client.resolved_capabilities.hover then
    return
  end

  -- TODO: Improve this lel.
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'vim' then
    return
  end

  if vim.api.nvim_buf_get_option(0, 'filetype') == 'ruby' then
    return
  end

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

return {
  on_attach = on_attach
}
