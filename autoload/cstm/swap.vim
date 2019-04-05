let s:pairs = {
      \   'true': 'false',
      \   'false': 'true'
      \ }

function s:is_swappable(word) abort
  return utils#fct#any(keys(s:pairs), {w -> w == a:word})
endfunction

function s:swap_word(word) abort
  if !has_key(s:pairs, a:word) | return | endif
  let l:other_word = s:pairs[a:word]

  let l:content = getline('.')
  let l:updated_content = substitute(l:content, a:word, l:other_word, '')

  call setline('.', l:updated_content)
endfunction

function! cstm#swap#execute(direction) abort
  let l:word = expand('<cword>')
  if s:is_swappable(l:word)
    return s:swap_word(l:word)
  endif

  if a:direction == 1
    execute "normal! " . v:count1 . "\<C-A>"
  else
    execute "normal! " . v:count1 . "\<C-X>"
  endif
endfunction
