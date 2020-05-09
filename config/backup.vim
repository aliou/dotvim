" Set undo and backups directories. The two trailing slashes prompt vim to
" include the full escaped path of the relevant buffer, to avoid colisions
" between files with the same name.
set undodir=~/.config/vim/tmp/undo//
set backupdir=~/.config/vim/tmp/backup//

" Create these directory if they don't exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), 'p')
endif

" Don't bother backing up files in some directories:
" * /dev/shm: RAM disk, default path for password-store’s temporary files
" * /usr/tmp: Hard-coded path for sudoedit(8) [1/2]
" * /var/tmp: Hard-coded path for sudoedit(8) [2/2]
" We prepend those directories to the backupskip option.
set backupskip^=/dev/shm/*,/usr/tmp/*,/var/tmp/*

set backup
set undofile
set noswapfile
