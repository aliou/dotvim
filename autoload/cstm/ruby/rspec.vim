let s:focusable_terms = ['context', 'it', 'describe']
let s:focused_pattern = '\<f\(' . join(s:focusable_terms, '\|') . '\)\>'
let s:not_focused_pattern = '\(\<' . join(s:focusable_terms, '\>\|') . '\>\)'

function! s:is_focusable(line) abort
  return utils#fct#any(s:focusable_terms, {term -> a:line =~ '\<f*' . term . '\>'})
endfunction

function s:is_focused(line) abort
  return utils#fct#any(s:focusable_terms, {term -> a:line =~ '\<f' . term . '\>'})
endfunction

function! cstm#ruby#rspec#toggle_focus() abort
  let l:block_start = search(join([s:focused_pattern, s:not_focused_pattern], '\|'), 'bn')
  let l:line_nr = l:block_start == 0 ? '.' : l:block_start
  let l:current_line = getline(l:line_nr)

  if !s:is_focusable(l:current_line) | return | endif

  if s:is_focused(l:current_line)
    let l:updated_line = substitute(l:current_line, s:focused_pattern, '\1', '')
  else
    let l:updated_line = substitute(l:current_line, s:not_focused_pattern, 'f\1', '')
  endif

  call setline(l:line_nr, l:updated_line)
  silent write
endfunction
