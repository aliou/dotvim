" TODO: Move all of this into a `on_attach` callback. This way, we're sure this
" is only execute for a running LSP client. The mapping will be done only for
" the current buffer, so we won't bother other buffer that don't have a running
" LSP server.
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
    silent! execute "normal! \<c-]>"
    return
  endif

  lua vim.lsp.buf.definition()
endfunction

let s:ignored_filetypes_hover = ['vim', 'ruby']
function! cstm#lsp#hover()
  if !cstm#lsp#is_running() || index(s:ignored_filetypes_hover, &ft) != -1
    silent! execute "normal! K"
    return
  endif

  lua vim.lsp.buf.hover()
endfunction
