" Toggle quickfix window.
" Using `nmap` instead of the useal `nnoremap` because we actually want the
" mapping to be recursive as `<Plug>qf_qf_toggle` is also a map.
nmap <leader>q <Plug>qf_qf_toggle

" Adjust the height of the location / quickfix window to be at most 10 lines.
let g:qf_auto_resize = 1
