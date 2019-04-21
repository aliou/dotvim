" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

" Match the formatter width.
setlocal textwidth=98
let b:undo_ftplugin .= " | setlocal textwidth<"

" Use `elixir_ls` hover feature for help.
nmap <buffer> K <plug>(ale_hover)
let b:undo_ftplugin .= " | unnmap <buffer> K"

" Use Language server "goto definition" for "ctags" stuff.
" nmap <buffer> <c-]> <plug>(ale_go_to_definition)
" let b:undo_ftplugin .= " | unnmap <buffer> <c-]>"
