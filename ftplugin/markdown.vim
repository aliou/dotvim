command! -buffer -nargs=? -complete=file Preview call cstm#markdown#preview(<f-args>)
command! -buffer -nargs=? -complete=file MarkdownTOC call cstm#markdown#insert_toc(<f-args>)

let s:compe_config = {}
let s:compe_config.source = {
      \    'path': v:true,
      \    'buffer': v:true,
      \    'spell': v:true,
      \  }

autocmd Filetype markdown call compe#setup(s:compe_config, 0)
