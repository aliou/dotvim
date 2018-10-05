" dispatch.vim job strategy

if exists('g:autoloaded_dispatch_job')
  finish
endif
let g:autoloaded_dispatch_job = 1

if !exists('s:waiting')
  let s:waiting = {}
endif

if !exists('s:exits')
  let s:exits = {}
endif

function! dispatch#job#handle(request) abort
  if !get(g:, 'dispatch_experimental', 1)
    return 0
  endif
  if !has('job') || a:request.action !=# 'make'
    return 0
  endif
  call writefile([], a:request.file)
  let job = job_start([&shell, &shellcmdflag, a:request.expanded], {
        \ 'in_io': 'null',
        \ 'out_mode': 'nl',
        \ 'err_mode': 'nl',
        \ 'callback': function('s:output'),
        \ 'exit_cb': function('s:exit'),
        \ })
  let a:request.pid = job_info(job).process
  let ch_id = ch_info(job_info(job).channel).id
  let s:waiting[ch_id] = a:request
  call writefile([a:request.pid], a:request.file . '.pid')
  let a:request.handler = 'job'
  return 2
endfunction

function! s:complete(ch) abort
  let info = ch_info(a:ch)
  if info.out_status ==# 'closed' && info.err_status ==# 'closed' && has_key(s:exits, info.id)
    let request = remove(s:waiting, info.id)
    call writefile([remove(s:exits, info.id)], request.file . '.complete')
    call DispatchComplete(request.id)
  endif
endfunction

function! s:exit(job, status) abort
  let ch = job_info(a:job).channel
  let ch_info = ch_info(ch)
  let request = s:waiting[ch_info.id]
  let s:exits[ch_info.id] = a:status
  return s:complete(ch)
endfunction

let g:dispatch_job_log = []
function! s:output(ch, output) abort
  let ch_info = ch_info(a:ch)
  let request = s:waiting[ch_info.id]
  call writefile([a:output], request.file, 'a')

  if dispatch#request(getqflist({'all': 1}).title) isnot# request
    return
  endif

  let lefm = &l:efm
  let gefm = &g:efm
  let makeprg = &l:makeprg
  let compiler = get(b:, 'current_compiler', '')
  let cd = exists('*haslocaldir') && haslocaldir() ? 'lcd' : 'cd'
  let dir = getcwd()
  let modelines = &modelines
  try
    let &modelines = 0
    let b:current_compiler = get(request, 'compiler', '')
    if empty(b:current_compiler)
      unlet! b:current_compiler
    endif
    exe cd fnameescape(request.directory)
    let &l:efm = request.format
    let &g:efm = request.format
    let &l:makeprg = request.command
    caddexpr a:output
    call add(g:dispatch_job_log, &l:efm)
  finally
    let &modelines = modelines
    exe cd fnameescape(dir)
    let &l:efm = lefm
    let &g:efm = gefm
    let &l:makeprg = makeprg
    if empty(compiler)
      unlet! b:current_compiler
    else
      let b:current_compiler = compiler
    endif
  endtry
  cbottom
  call s:complete(a:ch)
endfunction

function! dispatch#job#activate(pid) abort
  return 0
endfunction
