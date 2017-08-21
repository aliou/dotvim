" Improve command line completion with tab. Helpful when fuzzy finding using
" `:find` and friends.
set wildmenu

" Recursively add directories to the path. Helpful for `:find` and friends.
set path+=**

" Ignored file patterns for file completion, `expand`, `glob` and `glopath`.
" Version control
set wildignore+=.hg,.git,.svn

" JS vendored files.
set wildignore+=*bower_components,*node_modules,_build

" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Compiled object files
set wildignore+=*.o,*.out

" Vim swap files
set wildignore+=*.sw?

" macOS bullshit
set wildignore+=*.DS_Store

" Personal bullshift
" set wildignore+=.tmux,.tags
