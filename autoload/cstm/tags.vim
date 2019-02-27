function! cstm#tags#list(expression) abort
  let l:tags = taglist(a:expression)
  " TODO: Bwtter error handling.
  if len(l:tags) == 0
    echoerr 'nope'
    return
  endif

  let l:files = map(copy(l:tags), {idx, tag -> tag.filename})
  return fzf#run(fzf#wrap('tags', {'source': l:files,
        \   'window': 'bot 10new',
        \   'options': '--reverse --select-1'
        \ }))

  " let l:tag = l:tags[0]

  " execute 'edit ' . l:tag.filename
  " " TODO: Flash the tag.
  " silent execute l:tag.cmd
endfunction
