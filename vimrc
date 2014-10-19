" vimrc
" Author: Aliou Diallo <code@aliou.me>
" Source: https://github.com/aliou/dotvim/blob/master/vimrc

" Init -------------------------------------------------------------------- {{{
set nocompatible
filetype off
" }}}

"   Vundle ---------------------------------------------------------------- {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'sjl/clam.vim'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-obsession'
Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter'
Plugin 'kristijanhusak/vim-multiple-cursors'

" Colors
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'aliou/moriarty.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'

syntax on
filetype indent plugin on
" }}}

" Basic options ----------------------------------------------------------- {{{

let mapleader = ","		" <Leader> key.
set autoread			" Update modified files outside of VIM.
set cursorline " Highlight current line.
set hidden			" Allow buffers to be in the background without saving.
set laststatus=2		" Show status bar.
set cmdheight=2			" Status line height.
set noshowmode			" Hide current mode.
set number			" Show line number.
set showcmd			" Show current command.
set list			" Show invisible characters.
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Invisible character list.
set ruler			" Show line and column in status bar.
set background=dark		"
set t_Co=256			" Use 256 colors.
set scrolloff=999		" Keep the cursor centered in the screen
set showbreak=↪			" The character to put to show a line has been wrapped
set showmatch			" Highlight matching braces
set matchtime=5			"
set vb t_vb=			" SHUT THE FUCK UP.
set novisualbell		" SHUT THE FUCK UP.
set encoding=utf-8		" Character encoding.
set shortmess=filtoOA		" Short message.
set report=0			" Report all changes.
set notimeout			" Timeout on key codes.
set ttimeout
set ttimeoutlen=10
set bs=indent,eol,start		" Backspace over everything in insert mode.
" }}}

" Backups ----------------------------------------------------------------- {{{
set backup			" Enable backups for Gundo (AKA Lifesaver).
set undofile			" Save the file.
set noswapfile		" HOW ABOUT FUCK YOU.

set undodir=~/.vim/tmp/undo//		" Undodir
set backupdir=~/.vim/tmp/backup//	" Backupdir.
set directory=~/.vim/tmp/swap//	" Swapfile.

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
" }}}

" Functions --------------------------------------------------------------- {{{
" Toggle the text width and the color column.
function! ToggleWidth()
  if &l:textwidth >= 80
    set tw=0 cc=0
  else
    set tw=80 cc=+1
  endif
endfunction

" Visual search. Stolen from @sjl.
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
" }}}

" Search ------------------------------------------------------------------ {{{
set hlsearch				" Highlight results
set ignorecase			" Ignore casing of searches
set incsearch				" Start showing results as you type
set smartcase				" Be smart about case sensitivity when searching
set nostartofline		" Don't go back to the start of the line.
set gdefault				" Substitution is global by default. g to toggle.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'	" Match git conflict shit.
" }}}

" Tabs -------------------------------------------------------------------- {{{
set autoindent			" Copy indentation for new line.
set smartindent			" Autoindent.
set shiftwidth=2		" Number of spaces for indent.
set tabstop=2
set expandtab
" }}}

" Wildmenu completion  ----------------------------------------------------{{{
set wildmenu				" Comandline completion.
set wildmode=list:longest,full	" Show a list and match the longest first.

set wildignore+=.hg,.git,.svn		" Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg	" binary images
set wildignore+=*.o,*.out		" compiled object files
set wildignore+=*.spl			" compiled spelling word lists
set wildignore+=*.sw?			" Vim swap files
set wildignore+=*.DS_Store		" OSX bullshit
set whichwrap+=<,>,h,l,[,]		" Wrap chars.
" }}}

" Map --------------------------------------------------------------------- {{{

" Qwerty keyboard.
nnoremap ; :
vnoremap ; :

" Out of insert mode.
inoremap jj <ESC>
inoremap kk <ESC>

" Word wrapping.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Stay in visual mode when identing.
vnoremap > >gv
vnoremap < <gv

noremap <Leader>a ggVG		" Select all file.

" Splits.
nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l

nnoremap <silent> // :nohlsearch<CR>	" Remove search highligts.

nnoremap <leader>qq :cclose<CR> 	" Close quickfix window.
nnoremap <Leader><Leader> <C-^>	" Switch to alternate file.

nnoremap <silent> <Leader>z :bp<CR>	" Previous tab. (QWERTY)
nnoremap <silent> <Leader>x :bn<CR>	" Next tab.

nnoremap * *<c-o>			" Don't go to next match.

nnoremap <silent> <leader>d :cd %:p:h<cr>	" cd into current file directory.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w	" Split current line.

" Magic.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Resize splits.
if bufwinnr(1)
  noremap + <C-W>+
  noremap - <C-W>-
endif

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Open help in vertical split.
cnoremap vhelp vert bo help

" Open tag in right vertical split.
" nnoremap <c-\> <c-w>v<c-w><c-l><c-]><c-w><c-h>

" Set paste remap.
nnoremap <leader>p :set paste!<CR>

" Tabs
nnoremap T :tabnew<cr>
nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>

" Search for visual block.
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Quick file opening.
nnoremap <leader>lv :vsplit $MYLOCALVIMRC<cr>
nnoremap <leader>gv :vsplit $MYVIMRC<cr>

" Fold maps.
nnoremap <leader>f mfggvGzO`f
nnoremap <Space> za

" Quick toggle.
command! SS set spell!
command! TMC set list! number! | GitGutterToggle
"
" Remap W to w and Q to q so vim shuts the fuck up.
command W w
command Q q

" Toggle tw and cc.
nnoremap <Leader>w :call ToggleWidth()<CR>
" }}}

" autocmd ----------------------------------------------------------------- {{{

" Files ------------------------------------------------------------- {{{
augroup someshit
  autocmd!
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}
        \ set ft=ruby

  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell
  autocmd Filetype markdown setlocal textwidth=90000

  autocmd filetype gitcommit setlocal textwidth=72
  autocmd filetype gitcommit setlocal spell

  autocmd BufNewFile,BufRead *.json set filetype=json

  autocmd FileType * autocmd InsertLeave * silent! wa
augroup END

augroup dennisritchie
  autocmd FileType c,cpp
      \ nnoremap <localleader>k :silent Clam man <C-r><C-w><CR>gg:set ft=man<CR>
augroup END
" }}}

" Interface --------------------------------------------------------- {{{
augroup position
  autocmd!
  " Restore cursor position.
  autocmd BufReadPost *
        \ if &filetype !~ '^git\c' &&
        \ line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Resize splits when window is resized.
  autocmd VimResized * :wincmd =
augroup END
" }}}

" Folds -------------------------------------------------------------- {{{
" Unfold whole file.
set foldlevelstart=5

augroup filtypes
  autocmd!
  autocmd FileType c,cpp,cs,javascript setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype less,css,scss setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType html setlocal foldmethod=indent
  autocmd FileType ruby setlocal foldmethod=syntax
  autocmd Filetype ocaml setlocal foldmethod=expr foldexpr=OMLetFoldLevel(v:lnum)
augroup END
" }}}

" }}}

" Plugin config ---------------------------------------------------------- {{{

" Clam {{{
" Maps ! to Clam or ClamVisual depending on the mode.
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
" }}}

" CtrlP {{{
nnoremap <Leader>t :CtrlP<cr>

" Uses the current working directory as root folder.
let g:ctrlp_cmd = 'CtrlPCurWD'

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap <leader>y :CtrlPCurWD<CR>

" Change the listing order of the files in the match window.
let g:ctrlp_match_window_reversed = 0

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 0

" Ignore these specific files and folders.
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp|node_modules|venv|_site|vendor)$',
      \ 'file': '\v\.(o|exe|netrwhist|pdf|png|jpg|gif)|tags$',
      \ }
" }}}

" Syntastic {{{

" Syntax check on opening and saving buffers.
let g:syntastic_check_on_open=1

" Uses the sign interface to mark syntax errors.
let g:syntastic_enable_signs=1

" Don't check syntax for these filetypes.
let g:syntastic_mode_map = { "mode": "active",
      \ "active_filetypes": [],
      \ "passive_filetypes": ['html', 'css'] }

" Customize warning and error gutter symbols.
let g:syntastic_warning_symbol='⚠'
let g:syntastic_error_symbol='✗'
" }}}

" tComment {{{
" Comment current line or selection.
map <Leader>c <C-_><C-_>
" }}}

" NERDTree {{{
let NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\~$', '*.o']
" }}}

" Airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#hunks#enabled = 0

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
" }}}

" Startify {{{
" Custom header that shows the current directory's name.
let g:startify_custom_header =
      \ map(split(system('figlet -f slant `basename $PWD`'), '\n'),
      \ '"   ". v:val') + ['']

" Handy bookmarks.
let g:startify_bookmarks = [ '~/.vimrc', '~/.vimrc.local', '~/.bashrc.local']

" When opening recent file, change to `%w(git svn hg).sample` root folder.
let g:startify_change_to_vcs_root = 1

let g:startify_files_number = 5
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

let g:startify_custom_footer = [''] +
      \ map(split(system('echo -e "\n\n" && fortune'), '\n'), '"   ". v:val') +
      \ ['']

" }}}

" }}}

" Environments ----------------------------------------------------------- {{{
if has('gui_running')
  set go-=m
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R

  " Save on focus.
  autocmd FocusLost * silent! wa
endif
" }}}

" Local shit ------------------------------------------------------------- {{{
" Source local file if it exists.
if filereadable(glob("~/.vimrc.local"))
  let $MYLOCALVIMRC="~/.vimrc.local"
  source $MYLOCALVIMRC
endif
" }}}
