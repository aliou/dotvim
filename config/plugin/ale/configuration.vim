" Prepend the linter name, the severity and the error code (when present) to
" the error message.
let g:ale_echo_msg_format = '[%linter%] [%severity%] %[code] %%s'

" Only run on save.
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

" Disable population of location list.
let g:ale_set_loclist = 0

" Let shellcheck follow external sources.
let g:ale_sh_shellcheck_options = '-x'

" Use the relaxed configuration for yamllint.
let g:ale_yaml_yamllint_options = '-d relaxed'

" Use the local prettier configuration file.
let g:ale_javascript_prettier_use_local_config = 1

" Disable ALE when reading some source files.
let g:ale_pattern_options = { '/usr/local': { 'ale_enabled': 0 } }

" Only use the linters defined below.
let g:ale_linters_explicit = 1

" Always use local executables vs global executables.
let g:ale_use_global_executables = 0

let g:ale_linters = {
      \   'bash': ['shellcheck'],
      \   'css': ['stylelint'],
      \   'elixir': ['custom_elixir_ls', 'mix'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'sh': ['shellcheck'],
      \   'sql': ['sqlint'],
      \   'typescript': ['tsserver', 'tslint', 'eslint'],
      \   'vim': ['vint'],
      \ }

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'css': ['prettier', 'stylelint'],
\   'go': ['gofmt'],
\   'help': ['align_help_tags', 'remove_trailing_lines'],
\   'html': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'json': ['jq'],
\   'ruby': ['rubocop'],
\   'scss': ['prettier'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\   'typescriptreact': ['prettier', 'tslint', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_ruby_rubocop_executable = 'rubocop-daemon-wrapper'
