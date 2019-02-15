" This could be so much better, but my Regexp-fu is not as good as it used to
" be.
function! cstm#ruby#rspec#toggle_focus() abort
  let l:current_line = getline('.')
  if !s:is_focusable(l:current_line)
    return
  endif

  if s:is_focused(l:current_line)
    let l:updated_line = substitute(l:current_line, 'f\(context\|it\|describe\)', '\1', "")
  else
    let l:updated_line = substitute(l:current_line, '\<\(context\|it\|describe\)\>', 'f\1', "")
  endif

  call setline('.', l:updated_line)
  write
endfunction

let s:focused = '^RSpec\.\|\s*\(\<fcontext\>\|\<fit\>\|\<fdescribe\>\)'
let s:expression = '^RSpec\.\|\s*\(\<f*context\>\|\<f*it\>\|\<f*describe\>\)'
function! s:is_focusable(line) abort
  return a:line =~ s:expression
endfunction

function s:is_focused(line) abort
  return a:line =~ s:focused
endfunction
