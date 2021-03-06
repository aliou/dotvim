function! s:is_valid_buffer(_index, buffer) abort
  return buflisted(a:buffer) && getbufvar(a:buffer, '&filetype') !=# 'qf' &&
        \ getbufvar(a:buffer, '&filetype') !=# 'netrw' &&
        \ a:buffer != bufnr('')
endfunction

function! cstm#fuzzy#buffers#list() abort
  let l:buffers = range(1, bufnr('$'))
  let l:valid_buffers = filter(l:buffers, function('s:is_valid_buffer'))

  return sort(map(l:valid_buffers, 'bufname(v:val)'))
endfunction
