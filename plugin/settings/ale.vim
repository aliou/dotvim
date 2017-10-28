" Prepend linter name to the message.
let g:ale_echo_msg_format = '[%linter%] %s'

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

" Disable for Fastlane files and for alacritty configuration file.
let g:ale_pattern_options = {
\  'Fastfile$': { 'ale_enabled': 0 },
\  'Appfile$': { 'ale_enabled': 0 },
\  'Matchfile$': { 'ale_enabled': 0 },
\  'alacritty\/config\.yml$': { 'ale_enabled': 0 },
\  '.env$': { 'ale_enabled': 0 }
\}

call ale#fix#registry#Add(
\  'rustfmt', 'ale_fixers#rustfmt#Fix', ['rust'], 'Fix Rust files with rustfmt'
\)

" Allows you to "fix" your code.
let g:ale_fixers = {
\  'c': ['clang-format'],
\  'cpp': ['clang-format'],
\  'elixir': ['mix_format'],
\  'go': ['gofmt'],
\  'help': ['align_help_tags', 'remove_trailing_lines'],
\  'javascript': ['prettier'],
\  'ruby': ['rubocop'],
\  'rust': ['rustfmt'],
\}
