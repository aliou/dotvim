" Don't try to complete from included files, just use the open buffers and the
" tags.
set complete-=i

" Improve command line completion with tab. Helpful when fuzzy finding using
" `:find` and friends.
set wildmenu

" Ignored file patterns for file completion, `expand`, `glob`, `glopath`
" and FuzzyFiles.
" Version control
set wildignore+=.hg,.git,.svn,.gitkeep

" JS vendored files.
set wildignore+=*bower_components,*node_modules,_build,.yarn,*/node_modules/*,*/dist/*

" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Compiled object files
set wildignore+=*.o,*.out

" System files
set wildignore+=*.DS_Store

" Project files
set wildignore+=.tmux,.tags,.root

" Complete files without case sensitivity.
set wildignorecase
