command! -buffer SpecToggleFocus call cstm#ruby#rspec#toggle_focus()

nnoremap <buffer> <silent> <leader>f :SpecToggleFocus<CR>

nnoremap <buffer> ]r :call cstm#ruby#rspec#next_term(-1)<CR>
nnoremap <buffer> [r :call cstm#ruby#rspec#next_term(1)<CR>
