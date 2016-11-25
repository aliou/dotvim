" set cursorline         " Highlight current line.
set hidden             " Allow buffers to be in the background without saving.
set noshowmode         " Hide current mode.
set showcmd            " Show current command.

set relativenumber     " Show relative line number.
set number             " Show line number.

set list               " Show invisible characters.
set listchars=tab:›\ ,eol:¬,trail:⋅ " Invisible character list.

set showbreak=↪        " The character to put to show a line has been wrapped
set scrolloff=999      " Keep the cursor centered in the screen
set showmatch          " Highlight matching braces
set report=0           " Report all changes.
" set completeopt=menu   " Don't show the preview buffer. (Useful for vim-go)

set textwidth=80       " Default text width is 80 characters.
set colorcolumn=+1     " Highlight the column after the tw limit.
set splitbelow         " Always split below.
set splitright         " And always split right.

" '1000 => Number of previously edited files for which the marks are remembered.
" <500  => Number of lines saved for each register.
" :500  => Number of items in the command-line history to be saved.
" /500  => Number of items in the search pattern history to be saved.
set viminfo='1000,<500,:500,/500
" Previous / default value:
" set viminfo=!,'100,<50,s10,h

" Backups ---------------------------------------------------------------- {{{
" TODO: Disable when root user.
set undodir=~/.vim/tmp/undo//     " Undodir
set backupdir=~/.vim/tmp/backup// " Backupdir.
set directory=~/.vim/tmp/swap//   " Swapfile.

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
" }}}
