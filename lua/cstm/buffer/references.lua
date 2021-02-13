local status = require('cstm.status')

local find = function()
  status.set_status(status.in_progress)
  vim.lsp.buf.references({ includeDeclaration = false })
end

return {
  find = find
}
