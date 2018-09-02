call ale#Set('json_jq_executable', 'jq')
call ale#Set('json_jq_options', '')
call ale#Set('json_jq_filters', '.')

function! cstm#fixers#jq#fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'json_jq_executable')
    let l:options = ale#Var(a:buffer, 'json_jq_options')
    let l:filters = ale#Var(a:buffer, 'json_jq_filters')

    if empty(l:filters)
        return 0
    endif

    return {
    \   'command': ale#Escape(l:executable)
    \       . (empty(l:options) ? '' : ' ' . l:options)
    \       . " '" . l:filters . "'"
    \}
endfunction
