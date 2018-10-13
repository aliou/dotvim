" Add support for ElixirLS.
call ale#linter#Define('elixir', {
\   'name': 'custom_elixir_ls',
\   'lsp': 'stdio',
\   'executable_callback': 'ale_linters#elixir#elixir_ls#GetExecutable',
\   'command': '%e',
\   'language': 'elixir',
\   'project_root_callback': 'ale_linters#elixir#elixir_ls#GetProjectRoot'
\})

call ale#fix#registry#Add(
\  'mix_custom_format', 'cstm#fixers#mix_format#fix', ['elixir'], 'Fix elixir files'
\)
