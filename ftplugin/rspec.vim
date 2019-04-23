command! -buffer SpecToggleFocus call cstm#ruby#rspec#toggle_focus()
nnoremap <buffer> <silent> <leader>f :SpecToggleFocus<CR>

let b:undo_ftplugin = "nunmap <buffer> <leader>f"
