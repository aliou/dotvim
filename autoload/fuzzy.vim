let s:fuzzy_title = ''

function! fuzzy#files(args) abort
  " By default, use the folder passed as argument. Otherwise, get the current
  " file's project directory.
  let l:source_dir = empty(a:args) ? fuzzy#files#source_directory() : a:args
  let l:source = fuzzy#files#source(l:source_dir)

  " Decorate the option dict to be understood by 'FZF'
  let l:args = { 'source': l:source, 'window':  'bot 10new' }
  let l:wrapped = fzf#wrap('fuzzy#files', l:args)

  " Run da ting.
  let s:fuzzy_title = 'Files: ' . l:source_dir
  call fzf#run(l:wrapped)
endfunction

function! fuzzy#buffers(args) abort
  " Open the file pass as argument if present.
  if a:args !=# ''
    execute 'edit' a:args
    return
  endif

  " Don't bother doing anything if there are no buffers to choose from.
  let l:source = fuzzy#buffers#list()
  if len(l:source) < 2
    return
  endif

  " Decorate the option dict to be understood by 'FZF'
  let l:args = { 'source': l:source, 'window': 'bot 10new' }
  let l:wrapped = fzf#wrap('fuzzy#buffers', l:args)

  " Run da ting.
  let s:fuzzy_title = 'Buffers'
  call fzf#run(l:wrapped)
endfunction

function! fuzzy#mru(args) abort
  " Open the file pass as argument if present.
  if a:args !=# ''
    execute 'edit' a:args
    return
  endif

  let l:source = fuzzy#mru#list()
  if len(l:source) < 2
    return
  endif

  " Decorate the option dict to be understood by 'FZF'
  let l:args = { 'source': l:source, 'window': 'bot 10new' }
  let l:wrapped = fzf#wrap('fuzzy#mru', l:args)

  " Run da ting.
  let s:fuzzy_title = 'MRU'
  call fzf#run(l:wrapped)
endfunction

function! fuzzy#title() abort
  return s:fuzzy_title
endfunction
