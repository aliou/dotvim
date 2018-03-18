" Visual search. Stolen from <https://github.com/sjl>.
function! s:VisualSetSearch()
  let l:temp = @@
  normal! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction

vnoremap * :<C-u>call s:VisualSetSearch()<CR>//<CR>
vnoremap # :<C-u>call s:VisualSetSearch()<CR>??<CR>
