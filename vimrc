" vimrc
" Author: Aliou Diallo <aliou.diallo@me.com>
" Source: https://github.com/aliou/dotvim/blob/master/vimrc

" Init -------------------------------------------------------------------- {{{
set nocompatible
filetype off
" }}}

"   Vundle ---------------------------------------------------------------- {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scratch.vim'
Bundle 'sjl/clam.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-obsession'
Bundle 'scrooloose/syntastic'

" Colors
Bundle 'holokai'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'godlygeek/csapprox'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'

syntax on
filetype indent plugin on
" }}}

" Basic options ----------------------------------------------------------- {{{

let mapleader = ","		" <Leader> key.
set autoread			" Update modified files outside of VIM.
set textwidth=80		" Character limit.
set colorcolumn=+1		" Highlight character limit.
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
set shortmess=filtIoOA		" Short message.
set report=0			" Report all changes.
set notimeout			" Timeout on key codes.
set ttimeout
set ttimeoutlen=10
set shell=/bin/bash\ --login
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

" Search ------------------------------------------------------------------ {{{
set hlsearch				" Highlight results
set ignorecase			" Ignore casing of searches
set incsearch				" Start showing results as you type
set smartcase				" Be smart about case sensitivity when searching
set nostartofline			" Don't go back to the start of the line.
set gdefault				" sed is global by default. g to toggle.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'	" Match git conflict shit.

" Visual search. Stolen from @sjl.
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
" }}}

" Tabs -------------------------------------------------------------------- {{{
set autoindent			" Copy indentation for new line.
set smartindent			" Autoindent.
set shiftwidth=2			" Number of spaces for indent.
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

" Stay in middle of window.
" nnoremap n nzzzv
" nnoremap N Nzzzv

noremap <Leader>a ggVG		" Select all file.

" Splits.
nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l

nnoremap <silent> // :nohlsearch<CR>	" Remove search highligts.

nnoremap <leader>qq :cclose<CR> 	" Close quickfix window.
nnoremap <Leader><Leader> <C-^>	" Switch to alternate file.

nnoremap <silent> <Leader>w :bp<CR>	" Previous tab. (AZERTY)
nnoremap <silent> <Leader>z :bp<CR>	" Previous tab. (QWERTY)
nnoremap <silent> <Leader>x :bn<CR>	" Next tab.

nnoremap * *<c-o>			" Don't go to next match.

nnoremap <silent> <leader>d :cd %:p:h<cr>	" cd into current file directory.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w	" Split current line.

" Magic.
nnoremap / /\v
vnoremap / /\v

" Resize splits.
if bufwinnr(1)
  noremap + <C-W>+
  noremap - <C-W>-
endif

" Move in insert mode.
inoremap <c-d> <c-o>x
inoremap <c-u> <c-o>u
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l
inoremap <c-h> <c-o>h

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Open help in vertical split.
cnoremap vhelp vert bo help
command! SS set spell!

" Go to tag under cursor.
" Forget that stupid muscle memory shit.
nnoremap <silent>gt :echo "Use <C-]>, stupid."<CR>

" Jump to tags.
nnoremap <c-]> <c-]>mzzvzz15<c-e>`z
nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z

" Tabs
nnoremap T :tabnew<cr>
nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>

" Search for visual block.
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" SHUT THE FUCK UP.
nnoremap Q <NOP>
" }}}

" <Fx> Maps {{{
inoremap <F2> <ESC>:NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F3> <ESC>:w<CR>:! clear ; echo '\#use "%";;' \| ocaml<cr>
nnoremap <F3> :w<cr>:! clear ; echo '\#use "%";;' \| ocaml<cr>
inoremap <F4> <ESC>:set paste!<CR>i
nnoremap <F4> :set paste!<CR>
inoremap <F5> <ESC>:GundoToggle<CR>
nnoremap <F5> :GundoToggle<CR>

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

  autocmd filetype gitcommit setlocal textwidth=72
  autocmd filetype gitcommit setlocal spell

  autocmd filetype css inoremap { <space>{<CR>}<esc>O
  autocmd BufWritePost *.c,*.cpp,*.h,*.hh,*.hpp silent! !ctags -R --exclude=*.so* .

  autocmd BufNewFile,BufRead *.t set filetype=cram

  autocmd FileType * autocmd InsertLeave * silent! wa
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

augroup cursorline_
  autocmd!
  " Hightlight current line in current window and normal mode.
  autocmd WinLeave,InsertEnter * set nocursorline
  autocmd WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Folds -------------------------------------------------------------- {{{
" Unfold whole file.
nnoremap <leader>f mfggvGzO`f
set foldlevelstart=1

augroup filtypes
  autocmd!
  autocmd FileType c,cpp setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype less,css setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType html setlocal foldmethod=manual
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

" Additional mapping for tag search
nnoremap <Leader>y :CtrlPTag<cr>

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<cr>

" Change the listing order of the files in the match window.
let g:ctrlp_match_window_reversed = 0

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 200

" Ignore these specific files and folders..
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp)$',
      \ 'file': '\v\.(o|exe|netrwhist)|tags$',
      \ }
let g:ctrlp_extensions = ['tag']

let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" }}}

" Gundo {{{
" }}}

" Syntastic {{{

" Syntax check on opening and saving buffers.
let g:syntastic_check_on_open=1

" Uses the sign interface to mark syntax errors.
let g:syntastic_enable_signs=1

" Opens error window when errors are detected, and closes when none are
" detected.
" let g:syntastic_auto_loc_list=1

" Don't check syntax for these filetypes.
let g:syntastic_mode_map = { "mode": "active",
      \			"active_filetypes": [],
      \			"passive_filetypes": ['html', 'css'] }

" }}}

" tComment {{{
" Comment current line or selection.
map <Leader>c <C-_><C-_>
" }}}

" NERDTree {{{
let NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\~$', '*.o']
" }}}

" Ocaml Fold {{{
augroup ocaml
  autocmd!
  autocmd FileType ocaml let g:ocaml_folding = 1
augroup END
" }}}

" }}}

" Local shit ------------------------------------------------------------- {{{
" Source local file if it exists.
if filereadable(glob("~/.vimrc.local")) 
  let $MYLOCALVIMRC="~/.vimrc.local"
  source $MYLOCALVIMRC
endif
" }}}
