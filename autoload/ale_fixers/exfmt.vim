function! ale_fixers#exfmt#Fix(buffer) abort
    return {
    \   'command': 'mix exfmt %t',
    \}
endfunction
