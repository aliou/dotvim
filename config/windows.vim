set textwidth=100      " Default text width is 80 characters.
set colorcolumn=+1     " Highlight the column after the tw limit.
set splitbelow         " Always split below.
set splitright         " And always split right.
set signcolumn=yes     " Always display signcolumn.

augroup cstm_windows
  autocmd!

  " Auto resize panes.
  autocmd VimResized * wincmd =
  autocmd FileType help setlocal textwidth=0
augroup END
