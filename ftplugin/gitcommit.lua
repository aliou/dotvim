local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'path' },
    -- { name = 'buffer' },
    -- { name = 'spell' },
  }
})
