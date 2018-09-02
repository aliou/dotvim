function! s:read_buffer() abort
  let l:view = winsaveview()
  silent! undojoin | silent! edit
  call winrestview(l:view)
endfunction

augroup cstm_plugin_ale
  autocmd!
  autocmd User ALEFixPost call s:read_buffer()
augroup END
