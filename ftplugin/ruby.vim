let g:gutentags_enabled = 1

let s:compe_config = {}
let s:compe_config.source = {
      \    'path': v:true,
      \    'spell': v:true,
      \    'nvim_lsp': v:true,
      \    'tags': v:true
      \  }

autocmd Filetype ruby call compe#setup(s:compe_config, 0)
echom "ftplugin ruby.vim"
