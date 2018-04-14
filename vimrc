if has('eval')
  let g:mapleader = ','
endif

" Load splitted configuration files.
runtime! config/**/*.vim
