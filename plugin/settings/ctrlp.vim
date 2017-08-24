" Set default mapping to invoke CtrlP. (Old habits die hard.)
let g:ctrlp_map = ',t'

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

" Reuse CTRLP.
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|startify'

" Reverse the listting order of the results.
let g:ctrlp_match_window = 'bottom,order:ttb'

" Use `rg` as custom search command if available.
if executable('rg')
  let g:ctrlp_user_command = 'rg --files  %s'
  let g:ctrlp_use_caching = 0
else
  " Use caching.
  let g:ctrlp_cache_dir = $HOME.'/.config/vim/tmp/cache'

  " Ignore these specific files and folders.
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp|node_modules|venv|_site|vendor|bower_components|deps|target)$',
        \ 'file': '\v\.(o|exe|netrwhist|pdf|png|jpg|gif)|tags$',
        \ }
endif

" Enable tag extension.
let g:ctrlp_extensions = ['tag']

let g:ctrlp_buffer_func = { 'enter': 'HideStatusLine', 'exit':  'ShowStatusLine' }

function! HideStatusLine()
  set laststatus=0
endfunc

function! ShowStatusLine()
 set laststatus=2
endfunc
