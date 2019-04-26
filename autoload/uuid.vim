function! uuid#v4() abort
  let l:bytes = map(range(32), function('s:random_character'))
  let l:bytes[12] = '4'
  let l:bytes[16] = ['8', '9', 'A', 'B'][utils#random() % 4]

  let l:uuid = utils#list#insert(l:bytes, 8, '-')
  let l:uuid = utils#list#insert(l:uuid, 13, '-')
  let l:uuid = utils#list#insert(l:uuid, 18, '-')
  let l:uuid = utils#list#insert(l:uuid, 23, '-')

  return join(l:uuid, '')
endfunction

" 36 is the number of displayable characters : 0-9 and A-Z.
function! s:random_character(...) abort
  let l:idx = utils#random() % 36
  return s:values[l:idx]
endfunction

let s:values = [
      \   "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D",
      \   "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
      \   "S", "T", "U", "V", "W", "X", "Y", "Z"
      \ ]
