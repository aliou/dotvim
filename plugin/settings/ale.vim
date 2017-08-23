" Custom ale pattern options.
" This option is here instead of in `after/plugin/ale.vim` because it needs to be evaluated before
" ale.
let g:ale_pattern_options =
      \ {
      \   'Fastfile$': { 'ale_enabled': 0 },
      \   'Appfile$': { 'ale_enabled': 0 },
      \   'Matchfile$': { 'ale_enabled': 0 },
      \   'alacritty\/config\.yml$': { 'ale_enabled': 0 }
      \ }
