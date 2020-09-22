" Set the vim directory as the first directory to search into.
set runtimepath^=~/.vim
" Add the after directory in the directory to search into.
set runtimepath+=~/.vim/after

" Update the value to include our updates.
let &packpath = &runtimepath

" Source the "regular" configuration file.
source ~/.vim/vimrc
