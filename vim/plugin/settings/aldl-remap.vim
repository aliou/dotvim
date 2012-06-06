" Lead with ,
let mapleader = ","

" Ugh.
nnoremap ; :
vnoremap ; :

" Remap jj to <ESC> because the button is really far.
inoremap jj <ESC>

" Indent all file
noremap <Leader>f gg=G''zz

" Remap F3 key to :make for c and c++ projects.
nnoremap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER>
inoremap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER>

" Quick (v)split.
nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>

" Close Quickfix window (,qq)
noremap <leader>qq :cclose<CR>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" c-d deletes characters in insert mode
inoremap <c-d> <c-o>x

" c-{jklh} moves around in insert mode
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l
inoremap <c-h> <c-o>h

" c-u undoes what you just did
inoremap <c-u> <c-o>u

" Select all text in current buffer
map <Leader>a ggVG

" Open last / alternate buffer.
noremap <Leader><Leader> <C-^>

" Move back and forth through previous and next buffers
" with ,z and ,x
nnoremap <silent> <Leader>z :bp<CR>
nnoremap <silent> <Leader>x :bn<CR>

" Clear current search highlight by double tapping
nmap <silent> // :nohlsearch<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

"(v)im (r)eload
nmap <silent> <Leader>rv :so %<CR>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

