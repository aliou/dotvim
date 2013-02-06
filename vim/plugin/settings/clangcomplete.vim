let g:clang_auto_select = 1
" let g:clang_hl_errors = 1
" let g:clang_close-preview = 1

autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
