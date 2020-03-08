if !exists('s:requests')
  let s:requests = {}
endif

function! search#command#execute(command) abort
  let l:job = job_start([&shell, &shellcmdflag, a:command], {
        \   'in_io': 'null',
        \   'out_mode': 'nl',
        \   'err_mode': 'nl',
        \   'callback': function('s:output'),
        \   'close_cb': function('s:closed'),
        \   'exit_cb': function('s:exit'),
        \ })
  let l:channel_id = ch_info(job_info(l:job).channel).id
  let s:requests[l:channel_id] = {
        \   'command': a:command,
        \   'output': [],
        \   'status': 0
        \ }
endfunction

function! s:output(channel, output) abort
  let l:id = ch_info(a:channel).id
  let l:output = split(a:output, "\n", 1)

  let l:request = s:requests[l:id]
  call extend(l:request.output, l:output)
endfunction

function! s:closed(channel) abort
  let l:id = ch_info(a:channel).id
  let l:request = s:requests[l:id]

  if l:request.status != 0
    let l:error_message = join(l:request.status)
    echoerr l:error_message

    return l:request.status
  endif

  call setqflist([]) " Empty current quick fix list. shrug
  caddexpr l:request.output
  copen
endfunction

function! s:exit(job, status) abort
  let l:channel = job_info(a:job).channel
  let l:id = ch_info(l:channel).id
  let s:requests[l:id].status = a:status
endfunction
