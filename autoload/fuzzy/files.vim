" Generate an ignore file to pass to ripgrep containing the wildignore contents.
" TODO: See if it makes sense to also use the global vimrc.
function! s:rg_ignore_file() abort
  if exists('b:fuzzy_rg_ignore_file')
    return '--ignore-file ' . b:fuzzy_rg_ignore_file
  endif

  let b:fuzzy_rg_ignore_file = tempname()

  let l:current_file = buflisted(bufnr('')) ? expand('%:p') : ''
  let l:entries = split(&wildignore, ',') + [l:current_file]
  call writefile(l:entries, b:fuzzy_rg_ignore_file)

  return '--ignore-file ' . b:fuzzy_rg_ignore_file
endfunction

" TODO: Toggle hidden files.
function! fuzzy#files#source(args) abort
  let l:include_hidden = get(g:, 'fuzzy_include_hidden', 0)

  let l:command = 'rg --files '
        \ . s:rg_ignore_file() . ' '
        \ . (l:include_hidden ? '--hidden ' : '')
        \ . a:args

  return l:command
endfunction

function! fuzzy#files#toggle_ignore() abort
  let g:fuzzy_include_hidden = !get(g:, 'fuzzy_include_hidden', 0)
endfunction
