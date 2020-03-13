if exists('g:loaded_iw')
  finish
endif

let g:loaded_iw = 'ok'

nnoremap <silent> <leader>1 :call iw#highlight(1)<cr>
nnoremap <silent> <leader>2 :call iw#highlight(2)<cr>
nnoremap <silent> <leader>3 :call iw#highlight(3)<cr>
nnoremap <silent> <leader>4 :call iw#highlight(4)<cr>
nnoremap <silent> <leader>5 :call iw#highlight(5)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211

" command! -nargs=
