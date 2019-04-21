" Consider more symbols as part of a word text object. This is probably
" breaking some stuff but /shrug.
setlocal iskeyword+=!,?,@
let b:undo_ftplugin .= " | set iskeyword<"

nnoremap <silent> <buffer> K :call cstm#ruby#documentation()<CR>
nnoremap <silent> <buffer> <c-\> :call cstm#ruby#ptag()<CR>
let b:undo_ftplugin .= " | unmap <buffer> K"
let b:undo_ftplugin .= " | unmap <c-\>"

iabbrev describled_class described_class
let b:undo_ftplugin .= " | iunabbrev describled_class"
