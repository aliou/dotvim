" Disable text width limit and color column highlight.
set textwidth=0

" Enable folding of objects.
set foldmarker={,}
set foldmethod=marker

" Open all folds when entering a file.
augroup after_ftplugin_json
  autocmd!
  autocmd BufWinEnter * normal zR
augroup END
