" Don't try to complete from included files, just use the open buffers and the
" tags.
set complete-=i

" Better defaults for ALE and LSP.
set completeopt=menu,menuone,preview,noselect,noinsert

if has('wildmenu')
  " Improve command line completion with tab. Helpful when fuzzy finding using
  " `:find` and friends.
  set wildmenu

  if has('wildignore')
    " Ignored file patterns for file completion, `expand`, `glob` and `glopath`.
    " Version control
    set wildignore+=.hg,.git,.svn

    " JS vendored files.
    set wildignore+=*bower_components,*node_modules,_build

    " Binary images
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

    " Compiled object files
    set wildignore+=*.o,*.out

    " macOS bullshit
    set wildignore+=*.DS_Store

    " Personal bullshit
    set wildignore+=.tmux,.tags
  endif

  " Complete files without case sensitivity, if the option is available
  if exists('+wildignorecase')
    set wildignorecase
  endif
endif
