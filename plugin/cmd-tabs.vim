if exists('g:loaded_cmd_tabs') || !has('gui')
  finish
endif

" Move to tabs using <cmd-number>, like in Safari.
nnoremap <silent> <D-1> :tabnext 1<CR>
nnoremap <silent> <D-2> :tabnext 2<CR>
nnoremap <silent> <D-3> :tabnext 3<CR>
nnoremap <silent> <D-4> :tabnext 4<CR>
nnoremap <silent> <D-5> :tabnext 5<CR>
nnoremap <silent> <D-6> :tabnext 6<CR>
nnoremap <silent> <D-7> :tabnext 7<CR>
nnoremap <silent> <D-8> :tabnext 8<CR>
nnoremap <silent> <D-9> :tablast<CR>
