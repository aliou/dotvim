" TODO: Investigate `exrc` and `secure` for this.
" Source local file if it exists.
if filereadable(glob('~/.vimrc.local'))
  let $MYLOCALVIMRC='~/.vimrc.local'
  source $MYLOCALVIMRC
endif

" Source project configuration if it exists unless you're in the home folder.
if filereadable('.vimrc.local') && getcwd() != expand('~')
  source .vimrc.local
endif
