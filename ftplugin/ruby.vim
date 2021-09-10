let g:gutentags_enabled = 1

lua << EOF
local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'buffer' },
  }
})
EOF
