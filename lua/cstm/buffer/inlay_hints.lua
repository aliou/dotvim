local hints = require('lsp_extensions.inlay_hints')

local enable = function()
  vim.b.lsp_inlay_hints_enabled = true

  vim.cmd [[augroup lsp.inlay_hints]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[
    autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions').inlay_hints({ prefix = "» " })
  ]]
  vim.cmd [[augroup END]]

  hints.request({ prefix = "» " })
end

local disable = function()
  vim.b.lsp_inlay_hints_enabled = false

  vim.cmd [[augroup lsp.inlay_hints]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[augroup END]]

  hints.clear()
end

local toggle = function()
  if vim.b.lsp_inlay_hints_enabled then
    disable()
  else
    enable()
  end
end

return {
  toggle = toggle,
  enable = enable
}
