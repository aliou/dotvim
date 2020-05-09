let s:fuzzy_title = ''

" TODO: Change default value ? Drop preview ?
function! s:is_preview_enabled() abort
  return get(g:, 'cstm_fuzzy_preview_enabled', v:true)
endfunction

function! s:fzf_options() abort
  let l:bat_theme = &background == 'light' ? 'ansi-light' : 'ansi-dark'
  let l:preview_enabled = get(g:, 'cstm_fuzzy_preview_enabled', v:true)

  let l:options = '--reverse --select-1'

  if s:is_preview_enabled()
    let l:options .= ' --preview '
          \ . " 'bat --style=numbers --theme=" . l:bat_theme . " --color=always {}'"
          \ . ' --preview-window right:66%'
          \ . ' --bind ctrl-k:preview-up,ctrl-j:preview-down'
  endif

  return l:options
endfunction

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
        \   'options': s:fzf_options(),
        \   'window': s:is_preview_enabled() ? { 'width': 0.9, 'height': 0.8 } : { 'width': 0.6, 'height': 0.5 }
        \ }
  let l:args = utils#dictionnary#merge(l:options, l:arg_options, l:Resolver)

  return fzf#wrap(a:name, l:args)
endfunction

function! cstm#fuzzy#files(args) abort
  " By default, use the folder passed as argument. Otherwise, get the current
  " file's project directory.
  let l:source_dir = empty(a:args) ? cstm#fuzzy#files#source_directory() : a:args

  if l:source_dir == v:null
    call utils#message#error('Invalid source directory')
    return 1
  endif

  let l:source = cstm#fuzzy#files#source(l:source_dir)
  let l:options = s:wrap('cstm#fuzzy#files', l:source, { 'dir': l:source_dir })

  call fzf#run(l:options)
endfunction

" TODO: Merge cstm#fuzzy#buffers and cstm#fuzzy#files into one.
function! cstm#fuzzy#buffers(args) abort
  " Open the file pass as argument if present.
  if a:args !=# ''
    execute 'edit' a:args
    return
  endif

  " Don't bother doing anything if there are no buffers to choose from.
  let l:source = cstm#fuzzy#buffers#list()
  if len(l:source) < 2
    return
  endif

  let l:options = s:wrap('cstm#fuzzy#buffers', l:source)
  call fzf#run(l:options)
endfunction

function! cstm#fuzzy#mru(args) abort
  " Open the file pass as argument if present.
  if a:args !=# ''
    execute 'edit' a:args
    return
  endif

  let l:source = cstm#fuzzy#mru#list()
  if len(l:source) < 2
    return
  endif

  let l:options = s:wrap('cstm#fuzzy#mru', l:source)
  call fzf#run(l:options)
endfunction

function! cstm#fuzzy#title() abort
  return s:fuzzy_title
endfunction
