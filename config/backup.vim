" TODO: Disable when root user.
set undodir=~/.config/vim/tmp/undo//
set backupdir=~/.config/vim/tmp/backup//

" Create these directory if they don't exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), 'p')
endif

set backup
set undofile
set noswapfile
