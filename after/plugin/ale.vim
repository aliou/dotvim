" This maps are in `after` because they override mappings from another plugin
" (vim-unimpaired) and need to be loaded after it.

" Navigate between warnings.
nmap [a <Plug>(ale_previous)
nmap ]a <Plug>(ale_next)
