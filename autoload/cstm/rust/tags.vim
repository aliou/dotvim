" TODO: Error handling, lol.
" Check if start dir is really needed.
function! cstm#rust#tags#generate(start_dir) abort
  let l:command = ['rusty-tags', 'vi', '--quiet', '--start-dir=' . a:start_dir]
  call job_start(l:command)
endfunction
