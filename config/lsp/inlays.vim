if has('nvim')
  augroup lsp.inlays
    autocmd!
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
          \ lua require'lsp_extensions'.inlay_hints{ prefix = ' >> ', highlight = "Comment" }
  augroup END
endif
