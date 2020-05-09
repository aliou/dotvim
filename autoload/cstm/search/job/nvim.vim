if !exists('g:requests')
  let g:requests = {}
endif

function! cstm#search#job#nvim#execute(command) abort
  let l:job_id = jobstart([&shell, &shellcmdflag, a:command], {
        \  'on_stdout': function('s:on_output'),
        \  'on_stderr': function('s:on_output'),
        \  'on_exit': function('s:on_exit')
        \ })
  let g:requests[string(l:job_id)] = {
        \   'command': a:command,
        \   'output': [],
        \   'status': 0
        \ }
endfunction

function! s:on_output(job_id, data, name) abort
  call extend(g:requests[string(a:job_id)].output, a:data)
endfunction

function! s:on_exit(job_id, exit_code, _event_type) abort
  let g:requests[string(a:job_id)].status = a:exit_code
  let l:request = g:requests[string(a:job_id)]

  " Remove trailing empty strings returned by neovim.
  filter(l:request.output, "!empty(v:val)")

  if l:request.status != 0 || empty(l:request.output)
    call utils#message#error('Search: no results')
    return 1
  endif

  call setqflist([])
  caddexpr l:request.output
  botright cwindow
endfunction
