let s:spec_pattern = '^[ \t]*\(\<[Ii]ts\?\>\|\<[Dd]escribe\>\|\<[Cc]ontext\>\|\<[Ff]eature\>\|\<[Ss]cenario\>\|\<[Tt]est\>\)'

function! s:expr_from_line(line_nr) abort
  return printf('%s:%s:%s', expand('%'), a:line_nr, getline(a:line_nr))
endfunction

" Write the outline of the spec to the location list.
function! cstm#spec#outline() abort
  let l:outline = []
  call setloclist(0, l:outline, 'r', {'title': 'Spec Outline'})

  for l:lnr in range(1, line('$'))
    if getline(l:lnr) =~ s:spec_pattern
      let l:expr = s:expr_from_line(l:lnr)
      laddexpr l:expr
    endif
  endfor

  lopen
"   set conceallevel=2 concealcursor=nc
"   syntax match llFileName /^[^|]*|[^|]*| / transparent conceal
endfunction
