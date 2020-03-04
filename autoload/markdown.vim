" TODO: Check existante of `g:markdown_preview_command`.
" TODO: Allow configuration of command.
let s:markdown_preview_command = 'vmd'

function! s:preview(filepath)
  let l:command = s:markdown_preview_command . ' ' . a:filepath
  call job_start(['/bin/sh', '-c', l:command])
endfunction

function! markdown#preview(...) abort
  let l:file = get(a:000, 1, expand('%'))
  call s:preview(l:file)
endfunction
