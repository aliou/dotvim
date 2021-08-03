autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
autocmd BufWritePost <buffer> lua require('cstm.buffer.code_action').organize_imports()
