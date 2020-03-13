" Ignore casing of searches
set ignorecase

" Be smart about case sensitivity when searching
set smartcase

" Substitute all changes in a line by default. Toggle with `g`.
set gdefault

if has('extra_search')
  set incsearch
  set hlsearch
endif

function! s:clear_highlights()
  execute 'nohlsearch'

  if has('diff')
    execute 'diffupdate'
  endif

  call iw#clear_all()
endfunction

" Clear searches.
nnoremap <silent> <C-L>
      \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" nnoremap <silent> <C-L> :call s:clear_highlights()<cr>
" \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
