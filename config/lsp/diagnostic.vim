if has('nvim')
  let g:lsp_diagnostics_enabled = v:true

  lua require('cstm.lsp.diagnostic')

  function! s:setup_diagnostics()
    if !exists('b:lsp_diagnostics_enabled')
      let b:lsp_diagnostics_enabled = v:true
    endif

    if !exists('b:lsp_diagnostics_update_in_insert_enabled')
      let b:lsp_diagnostics_update_in_insert_enabled = v:true
    endif
  endfunction

  augroup lsp.diagnostic
    autocmd!
    autocmd BufEnter * call s:setup_diagnostics()
  augroup END

  " Navigate around warnings / errors.
  " TODO: At some point merge these maps with the error maps from ALE, see
  " config/plugin/ale/maps.vim
  nnoremap <silent> [d <cmd>silent lua vim.lsp.diagnostic.goto_prev({ wrap = true })<CR>
  nnoremap <silent> ]d <cmd>silent lua vim.lsp.diagnostic.goto_next({ wrap = true })<CR>

  " TODO: At some point, also merge this map with the buffer toggle from ALE,
  " see config/plugin/ale/maps.vim
  nnoremap <silent> <leader>dt <cmd>lua require('cstm.buffer.diagnostic').toggle()<CR>
endif
