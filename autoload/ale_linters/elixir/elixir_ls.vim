call ale#Set('elixir_elixir_ls_executable', 'elixir_ls')

function! ale_linters#elixir#elixir_ls#GetProjectRoot(buffer) abort
  let l:mix_file = ale#path#FindNearestFile(a:buffer, 'mix.exs')

  return !empty(l:mix_file) ? fnamemodify(l:mix_file, ':h') : ''
endfunction

function! ale_linters#elixir#elixir_ls#GetExecutable(buffer) abort
  return ale#Var(a:buffer, 'elixir_elixir_ls_executable')
endfunction
