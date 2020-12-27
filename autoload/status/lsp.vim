let s:in_progress = '⋯'
let s:failure = '✗'
let s:success = '✓'

let s:status_map = {
      \   'in_progress': s:in_progress,
      \   'error': s:failure,
      \   'done': s:success,
      \ }

function! status#lsp#diagnostic() abort
  if luaeval('not vim.tbl_isempty(vim.lsp.diagnostic.get_all()[' . bufnr() . '])')
    return s:failure
  endif

  return s:success
endfunction
