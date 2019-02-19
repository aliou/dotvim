let s:focusable_terms = ['context', 'it', 'describe']
function! cstm#ruby#rspec#toggle_focus() abort
  let l:current_line = getline('.')
  if !s:is_focusable(l:current_line) | return | endif

  if s:is_focused(l:current_line)
    let l:pattern = '\<f\(' . join(s:focusable_terms, '\|') . '\)\>'
    let l:updated_line = substitute(l:current_line, l:pattern, '\1', '')
  else
    let l:pattern = '\(\<' . join(s:focusable_terms, '\>\|') . '\>\)'
    let l:updated_line = substitute(l:current_line, l:pattern, 'f\1', '')
  endif

  call setline('.', l:updated_line)
  silent write

  echom 'focused current line'
endfunction

function! s:is_focusable(line) abort
  return utils#fct#any(s:focusable_terms, {term -> a:line =~ '\<f*' . term . '\>'})
endfunction

function s:is_focused(line) abort
  return utils#fct#any(s:focusable_terms, {term -> a:line =~ '\<f' . term . '\>'})
endfunction
