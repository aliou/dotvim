" Set default mapping to invoke CtrlP. (Old habits die hard.)
let g:ctrlp_map = ',t'

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

" Reuse CTRLP.
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|startify'

" Cache folder.
let g:ctrlp_cache_dir = $HOME.'/.config/vim/tmp/cache'

" Reverse the listting order of the results.
let g:ctrlp_match_window = 'bottom,order:ttb'

" Ignore these specific files and folders.
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp|node_modules|venv|_site|vendor|bower_components|deps|target)$',
      \ 'file': '\v\.(o|exe|netrwhist|pdf|png|jpg|gif)|tags$',
      \ }

" Enable tag extension.
let g:ctrlp_extensions = ['tag']

let g:ctrlp_buffer_func = { 'enter': 'HideStatusLine', 'exit':  'ShowStatusLine' }

function! HideStatusLine()
  set laststatus=0
endfunc

function! ShowStatusLine()
 set laststatus=2
endfunc
