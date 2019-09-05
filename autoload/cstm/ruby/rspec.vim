let s:focusable_terms = ['context', 'it', 'describe']
let s:focused_pattern = '\<f\(' . join(s:focusable_terms, '\|') . '\)\>'
let s:not_focused_pattern = '\(\<' . join(s:focusable_terms, '\>\|') . '\>\)'
let s:all_patterns = join([s:focused_pattern, s:not_focused_pattern], '\|')

function! s:is_focusable(line) abort
  return enum#any(s:focusable_terms, {term -> a:line =~ '\<f*' . term . '\>'})
endfunction

function! s:is_focused(line) abort
  return enum#any(s:focusable_terms, {term -> a:line =~ '\<f' . term . '\>'})
endfunction

function! s:closest_focusable_line() abort
  " Search for the patterns
  " `b` - backward,
  " `n` - without moving the cursor,
  " `W` - without wrapping around at the end of the file,
  " `z` - Start at the current position.
  let l:previous_match_lnr = search(s:all_patterns, 'bnWz')
  " Check if pattern is on the current line starting at the cursor.
  let l:next_match_lnr = search(s:all_patterns, 'nz', line('.'))

  " Return the current line if the pattern is present. Otherwise return the next
  " line.
  return l:next_match_lnr == 0 ? l:previous_match_lnr : l:next_match_lnr
endfunction

function! cstm#ruby#rspec#toggle_focus() abort
  let l:line_nr = s:closest_focusable_line()
  if l:line_nr == 0 | return | endif

  let l:content = getline(l:line_nr)
  if !s:is_focusable(l:content) | return | endif

  " TODO: Try to find a regular expression / replacement that works for focusing
  " and unfocusing.
  let [l:pattern, l:substition] = s:is_focused(l:content)
        \ ? [s:focused_pattern, '\1']
        \ : [s:not_focused_pattern, 'f\1']

  let l:updated_content = substitute(l:content, l:pattern, l:substition, '')

  call setline(l:line_nr, l:updated_content)
  silent write
endfunction

function! cstm#ruby#rspec#next_term(direction)
  let l:options = a:direction == 1 ? 'bWz' : 'Wz'
  echom a:direction l:options
  call search(s:all_patterns, l:options)
endfunction
