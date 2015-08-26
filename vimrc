" vimrc
" Author: Aliou Diallo <code@aliou.me>

" Init -------------------------------------------------------------------- {{{
set nocompatible
filetype off
" }}}

" Vundle {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'duggiefresh/vim-easydir'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-user'
Plugin 'majutsushi/tagbar'
Plugin 'markwu/ZoomWin'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/clam.vim'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/vitality.vim'
Plugin 'szw/vim-tags'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'aliou/moriarty.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/csapprox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'

syntax on
filetype indent plugin on
" }}}

" Basic options {{{

let mapleader = ","
set autoread           " Update modified files outside of VIM.
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
set matchtime=5
set vb t_vb=           " SHUT THE FUCK UP.
set novisualbell       " SHUT THE FUCK UP.
set encoding=utf-8     " Character encoding.
set shortmess=filtoOA  " Short message.
set report=0           " Report all changes.
set notimeout          " Timeout on key codes.
set ttimeout
set ttimeoutlen=10
set bs=indent,eol,start " Backspace over everything in insert mode.
set completeopt=menu    " Don't show the preview buffer. (Useful for vim-go)
set complete-=i         " Remove included files completion.

set textwidth=80        " Default text width is 80 characters.
set colorcolumn=+1      " Highlight the column after the tw limit.

runtime! ftplugin/man.vim " Adds `:Man` command.
runtime macros/matchit.vim " Required from some plugins.

set background=dark
set t_Co=256           " Use 256 colors.

set splitbelow

" }}}
"
" Backups ---------------------------------------------------------------- {{{
set backup     " Enable backups for Gundo
set undofile   " Save the file.
set noswapfile " HOW ABOUT FUCK YOU.

set undodir=~/.vim/tmp/undo//     " Undodir
set backupdir=~/.vim/tmp/backup// " Backupdir.
set directory=~/.vim/tmp/swap//   " Swapfile.

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
set hlsearch      " Highlight results
set ignorecase    " Ignore casing of searches
set incsearch     " Start showing results as you type
set smartcase     " Be smart about case sensitivity when searching
set nostartofline " Don't go back to the start of the line.
set gdefault      " Substitution is global by default. g to toggle.
match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Match git conflict shit.

match Error 'byebug'
match Error 'debugger'
" }}}

" Wildmenu completion  ----------------------------------------------------{{{
set wildmenu                   " Comandline completion.
set wildmode=list:longest,full " Show a list and match the longest first.

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

" Splits.
" nnoremap ss :split<CR><C-W>j
" nnoremap vv :vsplit<CR><C-W>l
nnoremap ss :echom 'C-W s opens a split. use it !'<CR>
nnoremap vv :echom 'C-W v opens a split. use it !'<CR>

" Remove search highligts.
nnoremap // :nohlsearch<CR>

" Close quickfix window.
" nnoremap <leader>qq :cclose<CR>
" nnoremap <leader>qp :pclose<CR>

nnoremap <leader>qp :echom "Use qq nigguh."<CR>
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
" vim:ft=vim
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

  " Resize splits when window is resized.
  " autocmd VimResized * :wincmd =
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
set tags=./tags

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

" Enable caching. Purge the cache by running <F5>.
let g:ctrlp_use_caching = 0

" Don't clear cache on exit.
" let g:ctrlp_clear_cache_on_exit = 0

" Cache folder.
let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/cache'

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

" Handy bookmarks.
let g:startify_bookmarks = [
      \ '~/Dropbox/2015/.currently/logs/code.md',
      \ '~/.vimrc',
      \ '~/.vimrc.local',
      \ '~/.bashrc.local',
      \ '~/.gitconfig'
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

" Toggle the text width and the color column.
function! s:ToggleWidth() " {{{
  if &l:textwidth >= 80
    set tw=0 cc=0
  else
    set tw=80 cc=+1
  endif
endfunction " }}}
command! -nargs=0 ToggleWidth call s:ToggleWidth()

" nnoremap <Leader>w :ToggleWidth<CR>

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

" Wipeout: Remove hidden buffers {{{
function! s:Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
" }}}
command! -nargs=0 Wipeout call s:Wipeout()

" Gtask: Run gulp tasks through dispatch. {{{

" Gulp function.
"
" Locally sets the make program to gulp <task>.
" TODO: Set the errorformat string so the quickfix only opens on error.
function! s:GulpTask(task)
  let &l:makeprg     = "gulp " . a:task
  let &l:errorformat = ""
  Make
endfunction

" GulpTask completion function.
"
" Gets all the tasks by opening the gulpfile and getting all the lines defining
" a task.
"
" Since we are using `-complete` instead of `-completelist`, we must return a
" string, with the different terms separated by '\n'.
"
" TODO: Use `-completelist` (Meaning filtering the terms by the first argument
" of the function. But "ain't nobody got time for that").
function! s:ListTasks(A, L, P)
  let tasks = []
  let regex = '\v("([^"]*)"|''([^'']*)'')'

  for line in readfile("gulpfile.js")
    if line =~ "gulp.task"
      let task = substitute(matchstr(line, regex), '\v("|'')', "", "g")
      call add(tasks, task)
    endif
  endfor

  return join(sort(tasks), "\n")
endfunction

" }}}
" Only define The `GulpTask` and `GTask` commands if the gulpfile exists.
if filereadable("gulpfile.js")
  command! -complete=custom,s:ListTasks -nargs=1 GulpTask :call s:GulpTask(<f-args>)
  command! -complete=custom,s:ListTasks -nargs=1 GTask :call s:GulpTask(<f-args>)
endif

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
  set guifont=Inconsolata\ for\ Powerline:h13
endif
" }}}

" Herping and Derping {{{
iabbrev funciton function
iabbrev retunr return
" }}}

" Local shit ------------------------------------------------------------- {{{
" Source local file if it exists.
if filereadable(glob("~/.vimrc.local"))
  let $MYLOCALVIMRC="~/.vimrc.local"
  source $MYLOCALVIMRC
endif

if filereadable('.vimrc.local') && getcwd() != expand('~')
  source .vimrc.local
endif
" }}}
