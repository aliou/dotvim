if exists('g:loaded_cstm_fuzzy')
  finish
endif

let g:loaded_cstm_fuzzy = 'ok'

command! -nargs=? -complete=dir FuzzyFiles
      \ call cstm#fuzzy#files(<q-args>)

command! -nargs=? -complete=buffer FuzzyBuffers
      \ call cstm#fuzzy#buffers(<q-args>)

command! -nargs=? -complete=customlist,cstm#fuzzy#mru#complete FuzzyMRU
      \ call cstm#fuzzy#mru(<q-args>)
