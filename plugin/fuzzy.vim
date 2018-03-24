nmap <leader>t <plug>(fuzzy_files)
nmap <leader>b <plug>(fuzzy_buffers)
" nmap <leader>m <plug>(fuzzy_mru)

command! -nargs=? -complete=dir FuzzyFiles call fuzzy#files(<q-args>)
command! FuzzyBuffers silent call fuzzy#buffers()
" command! -nargs=? -complete=dir FuzzyMRU call fuzzy#mru(<q-args>)

nnoremap <silent> <Plug>(fuzzy_files)   :FuzzyFiles<Return>
nnoremap <silent> <Plug>(fuzzy_buffers) :FuzzyBuffers<Return>
" nnoremap <silent> <Plug>(fuzzy_mru)     :FuzzyMRU<Return>
