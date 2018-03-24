function! s:is_valid_buffer(_index, buffer)
  return buflisted(a:buffer) && getbufvar(a:buffer, '&filetype') !=# 'qf'
endfunction

function! fuzzy#buffers#list()
  let l:buffers = range(1, bufnr('$'))
  let l:valid_buffers = filter(l:buffers, function('s:is_valid_buffer'))

  return sort(map(l:valid_buffers, 'bufname(v:val)'))
endfunction