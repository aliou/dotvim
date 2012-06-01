" Muscle memory.
map <Leader>t <C-p>

" Change the listing order of the files in the match window. The default setting
" (1) is from bottom to top: >
let g:ctrlp_match_window_reversed = 0


" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 10000

" Specify an external tool to use for listing files instead of using Vim’s
" |globpath()|. Use %s in place of the target directory: >
let g:ctrlp_user_command = {
      \   'types': {
      \       1: ['.git/', 'cd %s && git ls-files'],
      \       2: ['.hg/', 'hg --cwd %s locate -I .']
      \   },
      \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
      \ }
