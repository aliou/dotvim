function! fuzzy#files(args) abort
  " By default, use the folder passed as argument. Otherwise, get the current
  " file's project directory.
  let l:source_dir = empty(a:args) ? fuzzy#project#directory() : a:args
  let l:source = fuzzy#files#source(l:source_dir)

  " Decorate the option dict to be understood by 'FZF'
  let l:args = {
        \   'source': l:source,
        \   'window':  'bot 10new',
        \   'options': '--prompt ''' . l:source_dir . '/' .  ''''
        \ }
  let l:wrapped = fzf#wrap('fuzzy#files', l:args)

  " Run da ting.
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
  let l:args = {
        \   'source': l:source,
        \   'window': 'bot 10new',
        \   'options': '--prompt ''Buffers > '''
        \ }
  let l:wrapped = fzf#wrap('fuzzy#buffers', l:args)

  " Run da ting.
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
  let l:args = {
        \   'source': l:source,
        \   'window': 'bot 10new',
        \   'options': '--prompt ''MRU > '''
        \ }
  let l:wrapped = fzf#wrap('fuzzy#mru', l:args)

  " Run da ting.
  call fzf#run(l:wrapped)
endfunction
