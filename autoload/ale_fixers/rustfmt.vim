function! ale_fixers#rustfmt#Fix(buffer) abort
    return {
    \   'command': 'rustup run nightly rustfmt %t',
    \   'read_temporary_file': 1,
    \}
endfunction
