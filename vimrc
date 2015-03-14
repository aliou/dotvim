" vimrc
" Author: Aliou Diallo <code@aliou.me>

let mapleader = ","

" Stolen from @christoomey.
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

call s:SourceConfigFilesIn('rcplugins')

syntax on
filetype indent plugin on

call s:SourceConfigFilesIn('rcfiles')
