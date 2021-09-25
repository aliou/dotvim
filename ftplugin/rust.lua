local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  }
})
