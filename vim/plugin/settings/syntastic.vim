" Syntax check on opening and saving buffers.
let g:syntastic_check_on_open=1

" Uses the sign interface to mark syntax errors.
let g:syntastic_enable_signs=1

" Opens error window when errors are detected, and closes when none are
" detected.
" let g:syntastic_auto_loc_list=1

" Don't check syntax for these filetypes.
let g:syntastic_mode_map = { 'passive_filetypes' : ['html', 'css'] }

