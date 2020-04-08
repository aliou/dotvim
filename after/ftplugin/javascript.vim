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

" Include the packages directory in the list of directories to search in.
" This allows `gf` to find the vendored / local packages.
let b:packages = finddir('packages', fnamemodify(resolve(apathy#Real(@%)), ':h').';', -1)
if empty(b:packages)
  unlet b:packages
  finish
endif
call map(b:packages, 'fnamemodify(v:val, ":p:s?[\\/]$??")')

call apathy#Prepend('path', b:packages, apathy#EnvSplit($NODE_PATH))
