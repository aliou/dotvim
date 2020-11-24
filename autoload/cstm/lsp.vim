function! cstm#lsp#is_running() abort
  if !has('nvim')
    return v:false
  endif

  " TODO: Figure out why v:lua doesn't work here.
  return luaeval('require("cstm.lsp.util").is_running()')
endfunction

" TODO: Refactor the two functions below as they're basically the same one.
let s:ignored_filetypes_definition = ['vim', 'ruby']

function! cstm#lsp#definition() abort
  if !cstm#lsp#is_running() || index(s:ignored_filetypes_definition, &ft) != -1
    execute "normal! \<c-]>"
    return
  endif

  lua vim.lsp.buf.definition()
endfunction

let s:ignored_filetypes_hover = ['ruby']
function! cstm#lsp#hover()
  if !cstm#lsp#is_running() || index(s:ignored_filetypes_hover, &ft) != -1
    execute "normal! K"
    return
  endif

  lua vim.lsp.buf.hover()
endfunction
