" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

let b:match_ignorecase = 0

" Add JSX tags to match words.
let s:jsx_match_words = '(:),\[:\],{:},<:>,' .
      \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(/\@<!>\|$\):<\@<=/\1>,' .
      \ '<>:<\\>'

let b:match_words = exists('b:match_words')
      \ ? b:match_words . ',' . s:jsx_match_words
      \ : s:jsx_match_words

" Relative path in some of my javascript project.
setlocal path+=**
let b:undo_ftplugin .= " | setlocal path<"
