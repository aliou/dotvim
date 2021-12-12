function! status#diagnostic()
  if exists('b:status_value')
    return b:status_value
  endif

  return ''
endfunction
