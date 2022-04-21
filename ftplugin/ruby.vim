let g:gutentags_enabled = 1

" TODO: To Lua.
lua << EOF
local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'buffer' },
  }
})

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
EOF

" set foldlevelstart=99
