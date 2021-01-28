let s:in_progress = '⋯'
let s:failure = '✗'
let s:success = '✓'

" TODO: In some cases this seems to silently fail? (maybe when there's no lsp client running?)
function! status#lsp#diagnostic() abort
  if luaeval('not vim.tbl_isempty(vim.lsp.diagnostic.get(' . bufnr() . '))')
    return s:failure
  endif

  return s:success
endfunction
