function! fuzzy#files(args)
  " The command to use as file source.
  let l:source = fuzzy#files#source(a:args)

  " Open FZF window in the bottom with a height of 10 lines.
  let l:window = 'bot 10new'

  " The options to pass to FZF.
  " TODO: Use `args` as folder name if present.
  let l:options = '--prompt ''' . getcwd() . '/' .  ''''

  " Decorate the option dict to be understood by 'FZF'
  let l:args = {
        \   'source': l:source,
        \   'window': l:window,
        \   'options': l:options
        \ }
  let l:wrapped = fzf#wrap('fuzzy#files', l:args)

  " Run da ting.
  call fzf#run(l:wrapped)
endfunction

function! fuzzy#buffers()
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

function! fuzzy#mru(args)
  echom 'not implemented yet'
endfunction