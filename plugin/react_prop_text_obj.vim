" React Prop Text Object
" Requires https://github.com/kana/vim-textobj-user

" Given foo={bar}
" ar => |foo={bar}|
" ir => foo=|{bar}|

call textobj#user#plugin('reactprop', {
\   '-': {
\     'select-a-function': 'ReactPropA',
\     'select-a': 'ar',
\     'select-i-function': 'ReactPropI',
\     'select-i': 'ir',
\   },
\ })

function! ReactPropA()
  return ReactProp("before")
endfunction

function! ReactPropI()
  return ReactProp("after")
endfunction

function! ReactProp(when_to_get_position)
  let found = ToBeginningOfReactProp()
  if found

    if a:when_to_get_position == "before"
      let head_pos = getpos('.')
    endif

    " Jump to after the = sign
    normal! f=l

    if a:when_to_get_position == "after"
      let head_pos = getpos('.')
    endif

    let tail_pos = ToMatchingSurrounder()
    return ['v', head_pos, tail_pos]
  else
    return 0
  end
endfunction

let REACT_PROP_BEGINNING_RE = "\\<\\w\\+="
function! ToBeginningOfReactProp()
  " b = search backwards
  " c = accept a match at the cursor position
  " line(".") = stop after searching this line
  let result = search(g:REACT_PROP_BEGINNING_RE, "bc", line("."))
  if result == 0
    " We didn't find it searching backwards on this line, so try searching
    " forwards
    let result = search(g:REACT_PROP_BEGINNING_RE, "c", line("."))
  endif
  return result != 0
endfunction

function! ToMatchingSurrounder()
  " the character delimiting the value - either { or "
  let char_under_cursor = getline('.')[col('.')-1]

  if char_under_cursor == "{"
    normal! %
  else
    normal! f"
  endif

  return getpos('.')
endfunction
