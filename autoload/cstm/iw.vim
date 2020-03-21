let s:magic = 86750
let s:match_prefix = 'InterestingWord'

" TODO: Handle visual / selection mode thingy
function! cstm#iw#highlight(id) abort
   " Get currently highlighted word.
   let l:word = expand('<cword>')

   " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
   let l:match_id = s:magic + a:id

   " Clear existing matches.
   call iw#clear(l:match_id)

   " Construct a literal pattern that has to match at boundaries.
   let s:pattern = '\V\<' . escape(l:word, '\') . '\>'

   " Actually match the words.
   call matchadd(s:match_prefix . a:id, s:pattern, 1, l:match_id)
endfunction

function! s:filter_matches(match) abort
   return match(a:match.group, s:match_prefix . '.') != -1
endfunction

function! cstm#iw#clear(id, ...) abort
   let l:id = a:id < s:magic ? a:id + s:magic : a:id
   silent! call matchdelete(l:id)
endfunction

function! cstm#iw#clear_all() abort
   let l:matches = enum#filter(getmatches(), function('s:filter_matches'))
   let l:ids = enum#map(l:matches, {idx, match -> match.id})
   call enum#each(l:ids, function('iw#clear'))
endfunction
