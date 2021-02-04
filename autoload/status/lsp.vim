let s:in_progress = '⋯'
let s:failure = '✗'
let s:success = '✓'

function! status#lsp#diagnostic() abort
  if exists('b:status_value')
    return b:status_value
  end

  if luaeval('not vim.tbl_isempty(vim.lsp.diagnostic.get(' . bufnr() . '))')
    return s:failure
  endif

  return s:success
endfunction
