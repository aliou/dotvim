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

" Clear searches.
nnoremap <silent> <C-L>
      \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>:silent<space>ClearIW<CR><C-L>
