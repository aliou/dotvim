let s:pairs = {
      \   'true': 'false',
      \   'false': 'true'
      \ }

function s:is_swappable(word) abort
  return enum#any(keys(s:pairs), {w -> w == a:word})
endfunction

" TODO: This will actually swap the first occurrence of the word instead of the
" word under the cursor. This is Good Enough (TM) for now.
function s:swap_word(word) abort
  if !has_key(s:pairs, a:word) | return | endif
  let l:other_word = s:pairs[a:word]

  let l:content = getline('.')
  let l:updated_content = substitute(l:content, a:word, l:other_word, '')

  call setline('.', l:updated_content)
endfunction

function! s:plug(direction)
  return a:direction > 0 ? "\<Plug>CstmSwapUp" : "\<Plug>CstmSwapDown"
endfunction

function! s:fallback(direction)
  return "normal! " . v:count1 . (a:direction > 0 ? "\<C-A>" : "\<C-X>")
endfunction

function! cstm#swap#execute(direction) abort
  let l:word = expand('<cword>')

  if s:is_swappable(l:word)
    call s:swap_word(l:word)
  else
    execute s:fallback(a:direction)
  endif

  " Make the command that was just executed repeatable if tpope/vim-repeat is
  " available.
  silent! call repeat#set(s:plug(a:direction), a:direction)
endfunction
