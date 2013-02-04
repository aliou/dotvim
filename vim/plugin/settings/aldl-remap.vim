let mapleader = ","
let maplocalleader = "\\"

nnoremap ; :
vnoremap ; :

noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap <Leader>f gg=G''zz

nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l

nnoremap <leader>qq :cclose<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <silent> <Leader>z :bp<CR>
nnoremap <silent> <Leader>x :bn<CR>

nnoremap <silent> // :nohlsearch<CR>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap * *<c-o>

nnoremap <silent> <leader>d :cd %:p:h<cr>

nnoremap / /\v
vnoremap / /\v

nnoremap <F10> :set paste!<CR>
inoremap <F10> <ESC>:set paste!<CR>i

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

inoremap jj <ESC>
inoremap kk <ESC>

inoremap <c-d> <c-o>x
inoremap <c-u> <c-o>u
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l
inoremap <c-h> <c-o>h

map <Leader>a ggVG

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

cnoremap vhelp vert bo help
command! SS set spell!
