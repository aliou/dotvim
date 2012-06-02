" Lead with ,
let mapleader = ","

" Ugh.
nnoremap ; :
vnoremap ; :

" Remap jj to <ESC> because the button is really far.
inoremap jj <ESC>

" Don't save and quit when using gui.
if has('gui_running')
  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'w' : 'x'
endif

" Indent all file
map <Leader>f gg=G''

" Remap F3 key to :make for c and c++ projects.
nmap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER>
inoremap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER>

" Quick (v)split.
nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" c-d deletes characters in insert mode
imap <c-d> <c-o>x

" c-{jklh} moves around in insert mode
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l
imap <c-h> <c-o>h

" c-u undoes what you just did
imap <c-u> <c-o>u

" Search and replace word under cursor (,;)
:nnoremap <leader>; :%s/<C-r><C-w>//<Left>

" Select all text in current buffer
map <Leader>a ggVG

" Open last / alternate buffer.
noremap <Leader><Leader> <C-^>

" Move back and forth through previous and next buffers
" with ,z and ,x
nnoremap <silent> <Leader>z :bp<CR>
nnoremap <silent> <Leader>x :bn<CR>

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Clear current search highlight by double tapping
nmap <silent> // :nohlsearch<CR>

"(v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>
