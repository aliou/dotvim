let s:fuzzy_title = ''

function! s:wrap(name, source, ...) abort
  let s:fuzzy_title = a:name

  " Note: The whole appending logic is completely overkill. /shrug
  " See `autoload/utils/dictionnary.vim` for the steps to improve all of this.
  let l:arg_options = a:0 ? a:1 : {}
  let l:custom_options_should_append = a:0 >= 2 ? a:2 : v:false
  let l:Resolver = l:custom_options_should_append ?
        \ function('utils#dictionnary#append_resolver') :
        \ function('utils#dictionnary#keep_resolver')

  let l:options = {
        \   'source': a:source,
        \   'options': "--reverse --select-1 --preview 'cat {}'",
        \   'window': { 'width': 0.9, 'height': 0.8 }
        \ }
  let l:args = utils#dictionnary#merge(l:options, l:arg_options, l:Resolver)

  return fzf#wrap(a:name, l:args)
endfunction

function! fuzzy#files(args) abort
  " By default, use the folder passed as argument. Otherwise, get the current
  " file's project directory.
  let l:source_dir = empty(a:args) ? fuzzy#files#source_directory() : a:args
  let l:source = fuzzy#files#source(l:source_dir)

  let l:options = s:wrap('fuzzy#files', l:source, { 'dir': l:source_dir })
  call fzf#run(l:options)
endfunction

" TODO: Merge fuzzy#buffers and fuzzy#files into one.
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

  let l:options = s:wrap('fuzzy#buffers', l:source)
  call fzf#run(l:options)
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

  let l:options = s:wrap('fuzzy#mru', l:source)
  call fzf#run(l:options)
endfunction

function! fuzzy#projects(args) abort
  if a:args !=# '' | return fuzzy#projects#handler(a:args) | endif

  let l:source = fuzzy#projects#list()

  let l:custom_options = {
        \ 'sink': function('fuzzy#projects#handler'),
        \ 'options': '--no-sort --exact'
        \ }
  let l:options = s:wrap('fuzzy#projects', l:source, l:custom_options, v:true)
  call fzf#run(l:options)
endfunction

function! fuzzy#title() abort
  return s:fuzzy_title
endfunction
