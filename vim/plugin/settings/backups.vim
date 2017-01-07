" TODO: Disable when root user.
set undodir=~/.config/vim/tmp/undo//     " Undodir
set backupdir=~/.config/vim/tmp/backup// " Backupdir.
set directory=~/.config/vim/tmp/swap//   " Swapfile.

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

set backup     " Enable backups for Gundo
set undofile   " Save the file.
set noswapfile " Disable swap files.
