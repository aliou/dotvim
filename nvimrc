" nvimrc
" Author: Aliou Diallo <code@aliou.me>

" Basic options {{{
syntax on
filetype indent plugin on

let mapleader = ","
set cursorline         " Highlight current line.
set hidden             " Allow buffers to be in the background without saving.
set laststatus=2       " Show status bar.
set cmdheight=2        " Status line height.
set noshowmode         " Hide current mode.
set showcmd            " Show current command.

set relativenumber     " Show relative line number.
set number             " Show line number.

set list               " Show invisible characters.
set listchars=tab:›\ ,eol:¬,trail:⋅ " Invisible character list.

set showbreak=↪        " The character to put to show a line has been wrapped
set scrolloff=999      " Keep the cursor centered in the screen
set showmatch          " Highlight matching braces
set shortmess=filtoOA  " Short message.
set report=0           " Report all changes.
set notimeout          " Timeout on key codes.
set ttimeout
set ttimeoutlen=10
set completeopt=menu    " Don't show the preview buffer. (Useful for vim-go)

set textwidth=80        " Default text width is 80 characters.
set colorcolumn=+1      " Highlight the column after the tw limit.
set splitbelow          " Always split below.

runtime! ftplugin/man.vim " Adds `:Man` command.

" }}}

" Plugins {{{
call plug#begin('~/.nvim/bundle')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'duggiefresh/vim-easydir'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'markwu/ZoomWin'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/clam.vim'
Plug 'sjl/gundo.vim'
Plug 'sjl/vitality.vim'
Plug 'szw/vim-tags'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

Plug 'NLKNguyen/papercolor-theme'
Plug 'aliou/moriarty.vim'
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/csapprox'
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'

call plug#end()
" }}}

" Backups ---------------------------------------------------------------- {{{
set backup     " Enable backups for Gundo
set undofile   " Save the file.
set noswapfile " HOW ABOUT FUCK YOU.

set undodir=~/.nvim/tmp/undo//     " Undodir
set backupdir=~/.nvim/tmp/backup// " Backupdir.
set directory=~/.nvim/tmp/swap//   " Swapfile.

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

" Tabs -------------------------------------------------------------------- {{{
set autoindent   " Copy indentation for new line.
set smartindent  " Autoindent.
set shiftwidth=2 " Number of spaces for indent.
set tabstop=2
set expandtab
" }}}

" Search ------------------------------------------------------------------ {{{
set ignorecase    " Ignore casing of searches
set smartcase     " Be smart about case sensitivity when searching
set nostartofline " Don't go back to the start of the line.
set gdefault      " Substitution is global by default. g to toggle.
" }}}

" Wildmenu completion  ----------------------------------------------------{{{
set wildignorecase
set wildignore+=.hg,.git,.svn                  " Version control
set wildignore+=*bower_components,*node_modules,_build
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.out                      " compiled object files
set wildignore+=*.spl                          " compiled spelling word lists
set wildignore+=*.sw?                          " Vim swap files
set wildignore+=*.DS_Store                     " OSX bullshit
set whichwrap+=<,>,h,l,[,]                     " Wrap chars.
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

" Select whole file.
noremap <Leader>a ggVG

" Remove search highligts.
nnoremap // :nohlsearch<CR>

" Close quickfix window.
nnoremap <leader>qq :cclose \| pclose<CR>

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

" Previous and next buffer.
nnoremap <Leader>z :bp<CR>
nnoremap <Leader>x :bn<CR>

" Don't go to next match.
nnoremap * *<c-o>

" cd into current file directory.
nnoremap <leader>d :cd %:p:h<cr>

" Split current line.
" TODO: Remove this. (splitjoin)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Equalize splits in current tab.
nnoremap <localleader>= :wincmd =<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Open help in vertical split.
cabbrev vhelp vert bo help

" Set paste remap.
nnoremap <leader>p :set paste!<CR>

" Tabs
" nnoremap T :tabnew<cr>
nnoremap T :tabnew +Startify<cr>

" Quick file opening.
nnoremap <leader>lv :e $MYLOCALVIMRC<cr>
nnoremap <leader>gv :e $MYVIMRC<cr>

" Fold maps.
nnoremap <leader>f mfggvGzO`f
nnoremap <Space> za

" Quick toggle.
command! SS set spell!
command! TMC set list! number! relativenumber! | GitGutterToggle

" Remap W to w and Q to q so vim shuts the fuck up.
cabbrev W w
cabbrev Q q
cabbrev E e

" Duplicate current line.
nnoremap <c-d> Yp

" Source visual / current line.
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}}

" Files ------------------------------------------------------------- {{{
augroup localconfig
  autocmd!
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd FileType go,godoc setlocal ts=4 sw=4

  autocmd BufRead,BufNewFile *.{js.erb,es6} set ft=javascript

  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}
        \ set ft=ruby

  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell tw=0

  autocmd filetype gitcommit setlocal spell textwidth=72

  autocmd BufNewFile,BufRead *.json set filetype=json

  autocmd FileType * autocmd InsertLeave * silent! wa
augroup END

augroup dennisritchie
  autocmd FileType c,cpp
      \ nnoremap <localleader>k :silent Man <C-r><C-w><CR>gg:set ft=man<CR>
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
augroup END

let g:markdown_fenced_languages =
      \ ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript',
      \ 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'go']
" }}}

" Folds -------------------------------------------------------------- {{{
" Unfold whole file.
set foldlevelstart=5

augroup filtypes
  autocmd!
  autocmd FileType c,cpp,cs,javascript,go
        \ setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype less,css,scss setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType html setlocal foldmethod=indent
  autocmd FileType ruby setlocal foldmethod=syntax
augroup END
" }}}

" Tags ------------------------------------------------------------------- {{{
nnoremap <C-\> :ptag <C-R><C-W><CR>
vnoremap <C-\> "ty:ptag <C-R>t<CR>gv
vnoremap <C-\> "sy:Ack "<C-R>s"<CR>
" }}}

" Plugin config ---------------------------------------------------------- {{{

" Ack {{{
" Run searches asynchronously.
let g:ack_use_dispatch = 1
let g:ack_default_options =
      \ " -s -H --nocolor --nogroup --column --smart-case"
" }}}

" Clam {{{
" Maps ! to Clam or ClamVisual depending on the mode.
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
" }}}

" CtrlP {{{
" Set default mapping to invoke CtrlP. (Old habits die hard.)
let g:ctrlp_map = ',t'

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

" Additional mapping for current working dir.
nnoremap <leader>y :CtrlPCurWD<CR>

" The maximum number of files to scan, set to 0 for no limit:
let g:ctrlp_max_files = 5000

" Max depth to search into.
let g:ctrlp_max_depth = 40

" Don't jump to already open window.
let g:ctrlp_switch_buffer = 0

" Reuse CTRLP.
let g:ctrlp_reuse_window = 'startify'

" Cache folder.
let g:ctrlp_cache_dir = $HOME.'/.nvim/tmp/cache'

" Reverse the listting order of the results.
let g:ctrlp_match_window = 'bottom,order:ttb'

" Ignore these specific files and folders.
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp|node_modules|venv|_site|vendor|bower_components)$',
      \ 'file': '\v\.(o|exe|netrwhist|pdf|png|jpg|gif)|tags$',
      \ }

" Custom C matcher. Remember to compile matcher.
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
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
let g:startify_custom_header = ['', '']

let g:startify_list_order = [
      \ ['   Last recently modified files in the current directory:'],
      \ 'dir',
      \ ['   Last recently opened files:'],
      \ 'files',
      \ ['   My sessions:'],
      \ 'sessions',
      \ ['   My bookmarks:'],
      \ 'bookmarks',
      \ ]

" When opening recent file, change to `%w(git svn hg).sample` root folder.
let g:startify_change_to_vcs_root = 1

let g:startify_files_number = 5
" }}}

" Easy Align {{{

vmap <Enter> <Plug>(EasyAlign)
vnoremap <localleader><localleader> :EasyAlign=<CR>

" }}}

" Rails.vim {{{
let g:rails_projections = {
      \   "config/routes.rb": {
      \     "command":  "routes"
      \   },
      \   "app/serializers/*_serializer.rb": {
      \     "command":  "serializer",
      \     "affinity": "model",
      \     "test":     "spec/serializers/%s_spec.rb",
      \     "related":  "app/models/%s.rb",
      \     "template": "class %SSerializer < ActiveModel::Serializer\nend"
      \   },
      \   "app/uploaders/*_uploader.rb": {
      \     "command":  "uploader",
      \     "template": ["class %SUploader < CarrierWave::Uploader::Base", "end"],
      \     "test":     "spec/models/%s_uploader_spec.rb"
      \   },
      \   "app/services/*.rb": {
      \       "command":  "service",
      \       "template": "class %S\nend",
      \       "test":     "spec/services/%s_spec.rb"
      \   },
      \   "app/decorators/*_decorator.rb": {
      \     "command":  "decorator",
      \     "template": ["class {camelcase|capitalize|colons}Decorator"
      \                  . " < Draper::Decorator", "end"],
      \     "test": [
      \       "test/unit/%s_decorator_test.rb",
      \       "spec/decorators/%s_decorator_spec.rb"
      \     ],
      \    "affinity": "model"
      \   },
      \ }
" }}}

" vim-test {{{
nnoremap <leader>rt :TestNearest<CR>
nnoremap <leader>rT :TestFile<CR>
nnoremap <leader>rA :TestSuite<CR>
nnoremap <leader>rl :TestLast<CR>

let test#strategy = 'dispatch'
" }}}

" vim-go {{{
let g:go_bin_path = expand("~/src/.go/bin")
let g:go_fmt_command = "goimports"
let g:go_doc_command = "godoc"
let g:go_dispatch_enabled = 1
" }}}

" }}}

" Functions --------------------------------------------------------------- {{{
" @sjl / @stevelosh's Focus {{{

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.

function! s:Pulse() " {{{
  redir => old_hi
  silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 8
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 * width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()
nnoremap <c-e> mzzMzvzz15<c-e>`z:Pulse<cr>

" }}}

" Visual search. Stolen from @sjl.
function! s:VSetSearch() " {{{
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction " }}}

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>


" Breathe {{{
" Give more room to the current line.
"
" TODO: Visual mode.
function! s:Breathe() " {{{
  call append('.', '')
  call append(line('.') - 1, '')
endfunction " }}}
" }}}
command! -nargs=0 Breathe call s:Breathe()
nnoremap <c-b> :Breathe<cr>

" }}}

" Local shit ------------------------------------------------------------- {{{
" Source local file if it exists.
if filereadable(glob("~/.nvimrc.local"))
  let $MYLOCALVIMRC="~/.nvimrc.local"
  source $MYLOCALVIMRC
endif

if filereadable('.vimrc.local') && getcwd() != expand('~')
  source .vimrc.local
endif
" }}}
