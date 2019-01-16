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

nnoremap <silent> <leader>t :FuzzyFiles<Return>
nnoremap <silent> <leader>b :FuzzyBuffers<Return>
nnoremap <silent> <leader>m :FuzzyMRU<Return>
nnoremap <silent> <leader>p :FuzzyProjects<Return>
