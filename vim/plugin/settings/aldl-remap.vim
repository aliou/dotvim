" Lead with ,
let mapleader = ","

" Ugh.
nnoremap ; :
vnoremap ; :

" I'm lazy as fuck.
inoremap jj <ESC>
inoremap kk <ESC>

" Indent all file
noremap <Leader>f gg=G''zz

" Quick (v)split.
nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l

" Close Quickfix window (,qq)
nnoremap <leader>qq :cclose<CR>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

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
nnoremap <silent> // :nohlsearch<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Change directory to the directory of current open file.
nnoremap <silent> <leader>d :cd %:p:h<cr>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Always open help on vertical split.
cnoremap vhelp vert bo help

" Paste mode toggle.
nnoremap <F10> :set paste!<CR>
inoremap <F10> <ESC>:set paste!<CR>i
