" Fix current file.
nmap <silent> <leader>af <Plug>(ale_fix)

" Toggle Ale in the current buffer.
nmap <leader>at <Plug>(ale_toggle_buffer)

" Navigate between warnings.
nmap [a <Plug>(ale_previous)
nmap ]a <Plug>(ale_next)

" Prepend the linter name, the severity and the error code (when present) to
" the error message.
let g:ale_echo_msg_format = '[%linter%] [%severity%] %[code] %%s'

" Only run on save.
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Disable population of location list.
let g:ale_set_loclist = 0

" Let shellcheck follow external sources.
let g:ale_sh_shellcheck_options = '-x'

" Use the relaxed configuration for yamllint.
let g:ale_yaml_yamllint_options = '-d relaxed'

" Use the local prettier configuration file.
let g:ale_javascript_prettier_use_local_config = 1

" Disable ale on some files by default.
" - Disable on `.env` files.
" - Disable in Tim Pope's plugins.
" - Disable when `bundle open`-ing gems. This expects gems to be installed
"   through rbenv's `gem` command, which is the case most of the time for me.
let g:ale_pattern_options = {
      \   '\.env.*$': { 'ale_enabled': 0 },
      \   'tpope': { 'ale_enabled': 0 },
      \   '\.tmuxinator/.*.yml$': { 'ale_enabled': 0 },
      \   '/usr/local/var/rbenv/.*.rb$': { 'ale_enabled': 0 }
      \ }

call ale#fix#registry#Add(
\  'rustfmt', 'ale_fixers#rustfmt#Fix', ['rust'], 'Fix Rust files with rustfmt'
\)

call ale#fix#registry#Add(
\  'jq', 'ale_fixers#jq#Fix', ['json'], 'Fix JSON files using jq.'
\)

call ale#fix#registry#Add(
\  'mix_custom_format', 'ale_fixers#mix_custom_format#Fix', ['elixir'], 'Fix elixir files'
\)

let g:ale_linters = {
\  'elixir': ['mix', 'credo']
\}

" Allows you to "fix" your code.
let g:ale_fixers = {
\  'c': ['clang-format'],
\  'cpp': ['clang-format'],
\  'elixir': ['mix_custom_format'],
\  'go': ['gofmt'],
\  'help': ['align_help_tags', 'remove_trailing_lines'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['jq'],
\  'ruby': ['rubocop'],
\  'rust': ['rustfmt'],
\}

function! s:read_buffer() abort
  let l:view = winsaveview()
  silent! undojoin | silent! edit
  call winrestview(l:view)
endfunction

augroup cstm_plugin_ale
  autocmd!
  autocmd User ALEFixPost call s:read_buffer()
augroup END
