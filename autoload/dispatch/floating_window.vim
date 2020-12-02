if !exists('s:job_to_window')
  let s:job_to_window = {}
endif

let s:window_create = luaeval("require('cstm.floating').window.create")
let s:window_close = luaeval("require('cstm.floating').window.close")

let s:window_options = {
      \   'width': 0.9,
      \   'height': 0.8,
      \   'with_frame': v:true,
      \   'start_insert': v:true
      \ }

function! dispatch#floating_window#handle(request) abort
  if !has('nvim') | return 0 | endif

  " Allow enabling and disabling this handler on a per buffer basis.
  let l:enabled = utils#var('dispatch_use_floating_window', {'default': v:false})
  if !l:enabled | return 0 | endif

  if a:request.action ==# 'make'
    let l:command = dispatch#prepare_make(a:request)
  elseif a:request.action ==# 'start'
    let l:command = dispatch#prepare_start(a:request)
  endif

  let l:info = s:window_create(s:window_options)
  let l:job_id = termopen(l:command, {'on_exit': function('s:on_exit')})
  let s:job_to_window[l:job_id] = l:info.win_id

  return 1
endfunction

function! s:on_exit(job_id, _exit_code, _event_type) abort
  let l:window_id = s:job_to_window[a:job_id]

  call remove(s:job_to_window, a:job_id)
  call s:window_close(l:window_id)
endfunction
