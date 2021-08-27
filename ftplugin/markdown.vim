command! -buffer -nargs=? -complete=file Preview call cstm#markdown#preview(<f-args>)
command! -buffer -nargs=? -complete=file MarkdownTOC call cstm#markdown#insert_toc(<f-args>)

lua << EOF
local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'path' },
    -- { name = 'buffer' },
    -- { name = 'spell' },
  }
})
EOF
