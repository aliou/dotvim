scriptencoding utf-8

" Show current line number.
set number

" Show invisible characters.
set list

" Invisible character list.
set listchars+=nbsp:+      " Non-breaking spaces.
set listchars+=tab:›\      " Tab characters, preseces width
set listchars+=eol:¬       " End of line.
set listchars+=trail:⋅     " Trailing spaces

" Clearly show when the start or end of the row does not correspond to the
" start and end of the line
set listchars+=extends:>
set listchars+=precedes:<

set fillchars=diff:·

" Highlight cursorline.
set cursorline
