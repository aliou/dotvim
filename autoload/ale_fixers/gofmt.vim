function! ale_fixers#gofmt#Fix(buffer) abort
    return {
    \   'command': 'go fmt %t',
    \   'read_temporary_file': 1,
    \}
endfunction
