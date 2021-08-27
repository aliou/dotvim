" Manually setup tags for Rust files.
" Add the tag from the current directory and from the Rust Standard Library.
" TODO: Simply add the stdlib tags file path?
" TODO: Check if the stdlib pass exists / is accessible.
setlocal tags=./tags;/,$RUST_SRC_PATH/tags
let b:undo_ftplugin = "setlocal tags<"

lua << EOF
local cmp = require('cmp')

cmp.setup.buffer({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  }
})
EOF
