function! cstm#fixers#rustfmt#fix(buffer) abort
    return {
    \   'command': 'rustup run nightly rustfmt %t',
    \   'read_temporary_file': 1,
    \}
endfunction
