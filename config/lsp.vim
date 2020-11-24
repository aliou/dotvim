if has('nvim')
  lua require('cstm.lsp.init')

  nnoremap <silent> K :call cstm#lsp#hover()<CR>
  nnoremap <silent> <c-]> :call cstm#lsp#definition()<CR>
endif
