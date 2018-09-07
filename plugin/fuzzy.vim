if exists('g:loaded_fuzzy')
  finish
endif

" TODO: Configure fuzzy to work with typos ?
command! -nargs=? -complete=dir FuzzyFiles
      \ call fuzzy#files(<q-args>)

command! -nargs=? -complete=buffer FuzzyBuffers
      \ call fuzzy#buffers(<q-args>)

command! -nargs=? -complete=customlist,fuzzy#mru#complete FuzzyMRU
      \ call fuzzy#mru(<q-args>)

command! -nargs=? -complete=customlist,fuzzy#projects#complete FuzzyProjects
      \ call fuzzy#projects(<q-args>)

nnoremap <leader>t :FuzzyFiles<Return>
nnoremap <leader>b :FuzzyBuffers<Return>
nnoremap <leader>m :FuzzyMRU<Return>
