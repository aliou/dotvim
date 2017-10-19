" Fix current file.
nmap <silent> <leader>af <Plug>(ale_fix)

nnoremap <leader>at :ALEToggle<CR>

" Navigate between warnings.
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
