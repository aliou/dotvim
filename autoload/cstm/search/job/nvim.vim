if !exists('s:requests')
  let s:requests = {}
endif

function! cstm#search#job#nvim#execute(command) abort
  let l:job_id = jobstart([&shell, &shellcmdflag, a:command], {
        \  'on_stdout': function('s:on_output'),
        \  'on_stderr': function('s:on_output'),
        \  'on_exit': function('s:on_exit')
        \ })
  let s:requests[string(l:job_id)] = {
        \   'command': a:command,
        \   'output': [],
        \   'status': 0
        \ }
endfunction

function! s:on_output(job_id, data, name) abort
  call extend(s:requests[string(a:job_id)].output, a:data)
endfunction

function! s:on_exit(job_id, exit_code, _event_type) abort
  let s:requests[string(a:job_id)].status = a:exit_code
  let l:request = s:requests[string(a:job_id)]

  " Remove trailing empty strings returned by neovim.
  let l:request.output = enum#filter(l:request.output, {row -> empty(row) != 1})

  if l:request.status != 0 || empty(l:request.output)
    call utils#message#error('Search: no results')
    return 1
  endif

  call setqflist([])
  caddexpr l:request.output
  botright cwindow
endfunction
