set cursorline         " Highlight current line.
set hidden             " Allow buffers to be in the background without saving.
set showmode         " Hide current mode.
set showcmd            " Show current command.

set number             " Show current line number.

set list               " Show invisible characters.

" Invisible character list.
set listchars=tab:›\ ,eol:¬,trail:⋅
set fillchars=diff:·

set showbreak=↪        " The character to put to show a line has been wrapped
set scrolloff=999      " Keep the cursor centered in the screen
set showmatch          " Highlight matching braces
set report=0           " Report all changes.
" set completeopt=menu   " Don't show the preview buffer. (Useful for vim-go)

set textwidth=80       " Default text width is 80 characters.
set colorcolumn=+1     " Highlight the column after the tw limit.
set splitbelow         " Always split below.
set splitright         " And always split right.

" This makes :Make work with Tmux 2.3+ (for dispatch and Ack)
set shellpipe+=\ 

" '1000 => Number of previously edited files for which the marks are remembered.
" <500  => Number of lines saved for each register.
" :500  => Number of items in the command-line history to be saved.
" /500  => Number of items in the search pattern history to be saved.
set viminfo='1000,<500,:500,/500
" Previous / default value:
" set viminfo=!,'100,<50,s10,h

runtime macros/matchit.vim
