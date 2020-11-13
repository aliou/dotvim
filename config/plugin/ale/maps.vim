" Fix current file.
nmap <leader>af <Plug>(ale_fix)

" Toggle Ale in the current buffer.
" TODO: At some point, also merge this map with the buffer toggle from LSP,
" see config/lsp/diagnostics.vim
nmap <leader>at <Plug>(ale_toggle_buffer)

" Navigate between warnings.
" TODO: At some point merge these maps with the diagnostics maps from LSP, see
" config/lsp/diagnostics.vim
nmap [a <Plug>(ale_previous)
nmap ]a <Plug>(ale_next)
