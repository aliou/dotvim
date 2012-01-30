" =========================

" Lead with ,
let mapleader = ","

" Edit and source ~/.vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rl :so $MYVIMRC<CR>

" Don't save and quit
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'w' : 'x'

