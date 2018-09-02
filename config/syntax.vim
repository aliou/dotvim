" Options dependent on the syntax feature
if has('syntax') && !has('g:syntax_on')
  " Use syntax highlighting with 100 lines of context
  silent! syntax enable
  silent! syntax sync minlines=100

  " TODO: Try to detect the terminal background.
  " TODO: Make this work with macOS's background thing when Mojave comes out.
  set background=dark
  " silent! colorscheme untitled
  silent! colorscheme hybrid
endif
