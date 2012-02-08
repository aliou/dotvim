" =========================

" Lead with ,
let mapleader = ","

" Edit and source ~/.vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rl :so $MYVIMRC<CR>

" Don't save and quit
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'w' : 'x'

" Indent all file
map <Leader>f gg=G''

" Remap F3 key to :make for c and c++ projects.
nmap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER>
inoremap <F3> :w<ENTER>:!make > /dev/null<ENTER>:!./test<ENTER> 

