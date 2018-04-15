call ale#Set('elixir_mix_executable', 'mix')

function! cstm#fixers#mix_format#get_executable(buffer) abort
    return ale#Var(a:buffer, 'elixir_mix_executable')
endfunction

function! cstm#fixers#mix_format#fix(buffer) abort
    let l:config = ale#path#FindNearestFile(a:buffer, '.formatter.exs')

    return {
    \   'command': ale#Escape(cstm#fixers#mix_format#get_executable(a:buffer))
    \       . ' format'
    \       . (!(empty(l:config)) ? ' --dot-formatter ' . ale#Escape(l:config) : '')
    \       . ' %s'
    \}
endfunction

