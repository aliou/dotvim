call ale#Set('elixir_mix_executable', 'mix')

function! ale_fixers#mix_custom_format#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'elixir_mix_executable')
endfunction

function! ale_fixers#mix_custom_format#Fix(buffer) abort
    let l:config = ale#path#FindNearestFile(a:buffer, '.formatter.exs')

    return {
    \   'command': ale#Escape(ale_fixers#mix_custom_format#GetExecutable(a:buffer))
    \       . ' format %t'
    \       . (!(empty(l:config)) ? ' --dot-formatter ' . ale#Escape(l:config) : ''),
    \   'read_temporary_file': 1,
    \}
endfunction

