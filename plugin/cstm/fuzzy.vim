if exists('g:loaded_cstm_fuzzy')
  finish
endif

let g:loaded_cstm_fuzzy = 'ok'

" TODO: Configure fuzzy to work with typos ?
command! -nargs=? -complete=dir FuzzyFiles
      \ call cstm#fuzzy#files(<q-args>)

command! -nargs=? -complete=buffer FuzzyBuffers
      \ call cstm#fuzzy#buffers(<q-args>)

command! -nargs=? -complete=customlist,cstm#fuzzy#mru#complete FuzzyMRU
      \ call cstm#fuzzy#mru(<q-args>)

command! -nargs=? -complete=customlist,cstm#fuzzy#projects#complete FuzzyProjects
      \ call cstm#fuzzy#projects(<q-args>)

nnoremap <silent> <leader>t :FuzzyFiles<Return>
nnoremap <silent> <leader>b :FuzzyBuffers<Return>
nnoremap <silent> <leader>m :FuzzyMRU<Return>
nnoremap <silent> <leader>p :FuzzyProjects<Return>
