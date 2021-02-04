local status = require('cstm.status')

local default_handler = vim.lsp.handlers['textDocument/references']

vim.lsp.handlers['textDocument/references'] = function(...)
  default_handler(...)
  status.set_status(status.success)
end
