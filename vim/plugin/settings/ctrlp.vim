" Muscle memory.
let g:ctrlp_map = '<Leader>t'

" Uses the current working directory as root folder.
let g:ctrlp_cmd = 'CtrlPCurWD'

" Additional mapping for tag search
nnoremap <Leader>y :CtrlPTag<cr>
nnoremap <C-y> :CtrlPTag<cr>

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

" Change the listing order of the files in the match window.
let g:ctrlp_match_window_reversed = 0

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 2500

" Ignore these specific files and folders..
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp)$',
  \ 'file': '\v\.(o|exe|netrwhist)|tags$',
  \ }
let g:ctrlp_extensions = ['tag']
