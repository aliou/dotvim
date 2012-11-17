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
let g:ctrlp_max_files = 10000

" Specify an external tool to use for listing files instead of using Vim’s
" |globpath()|. Use %s in place of the target directory: >
" let g:ctrlp_user_command = {
"       \   'types': {
"       \       1: ['.git/', 'cd %s && git ls-files'],
"       \       2: ['.hg/', 'hg --cwd %s locate -I .']
"       \   },
"       \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
"       \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp)$',
  \ 'file': '\v\.(o|exe|netrwhist)$',
  \ }
let g:ctrlp_extensions = ['tag']
