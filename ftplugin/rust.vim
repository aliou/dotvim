" Manually setup tags for Rust files.
" Add the tag from the current directory and from the Rust Standard Library.
" TODO: Simply add the stdlib tags file path?
" TODO: Check if the stdlib pass exists / is accessible.
setlocal tags=./tags;/,$RUST_SRC_PATH/tags

" Disable Gutentags to prevent overwriting the `tags` file.
let g:gutentags_enabled = 0
