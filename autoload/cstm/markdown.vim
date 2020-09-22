" TODO: Check existante of `g:markdown_preview_command`.
" TODO: Allow configuration of command.
let s:markdown_preview_command = 'vmd'

function! s:run_command(command)
  if utils#is_vim()
    call job_start(['/bin/sh', '-c', a:command])
  elseif utils#is_neovim()
    call jobstart(['/bin/sh', '-c', a:command])
  endif
endfunction

function! s:preview(filepath)
  let l:command = s:markdown_preview_command . ' ' . a:filepath
  call s:run_command(l:command)
endfunction

function! cstm#markdown#preview(...) abort
  let l:file = get(a:000, 1, expand('%'))
  call s:preview(l:file)
endfunction

" TODO: Allow configuration of command.
let s:markdown_toc_command = 'npx markdown-toc -i'

" TODO: Display warning if "<!-- toc -->" is not in the file.
function! cstm#markdown#insert_toc() abort
  let l:file = get(a:000, 1, expand('%'))
  echom "Generating table of content..."
  call system(s:markdown_toc_command . ' ' . l:file)
  execute 'edit'

  echom "Table of content inserted / updated."
endfunction
