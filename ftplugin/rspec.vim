if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

command! -buffer SpecToggleFocus call cstm#ruby#rspec#toggle_focus()
nnoremap <buffer> <silent> <leader>f :SpecToggleFocus<CR>

let b:undo_ftplugin = "nunmap <buffer> <leader>f"
