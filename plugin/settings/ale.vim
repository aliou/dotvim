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
let g:ale_pattern_options = { '\.env.*$': { 'ale_enabled': 0 } }

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
