command! -buffer -nargs=? -complete=file Preview call cstm#markdown#preview(<f-args>)
command! -buffer -nargs=? -complete=file MarkdownTOC call cstm#markdown#insert_toc(<f-args>)
