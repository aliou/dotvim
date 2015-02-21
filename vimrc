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

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/clam.vim'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/vitality.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'

" Colors
Plugin 'aliou/moriarty.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/csapprox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'

syntax on
filetype indent plugin on
" }}}

" Basic options ----------------------------------------------------------- {{{

set autoread           " Update modified files outside of VIM.
let mapleader = ","    " <Leader> key.
set cursorline         " Highlight current line.
set hidden             " Allow buffers to be in the background without saving.
set laststatus=2       " Show status bar.
set cmdheight=2        " Status line height.
set noshowmode         " Hide current mode.
set relativenumber     " Show relative line number.
set number             " Show line number.
set showcmd            " Show current command.
set list               " Show invisible characters.
set listchars=tab:›\ ,eol:¬,trail:⋅ " Invisible character list.
set showbreak=↪        " The character to put to show a line has been wrapped
set background=dark
set t_Co=256           " Use 256 colors.
set scrolloff=999      " Keep the cursor centered in the screen
set showmatch          " Highlight matching braces
set matchtime=5
set vb t_vb=           " SHUT THE FUCK UP.
set novisualbell       " SHUT THE FUCK UP.
set encoding=utf-8     " Character encoding.
set shortmess=filtoOA  " Short message.
set report=0           " Report all changes.
set splitright         " Split right by default.
set notimeout          " Timeout on key codes.
set ttimeout
set ttimeoutlen=10
set bs=indent,eol,start " Backspace over everything in insert mode.
set completeopt=menu    " Don't show the preview buffer. (Useful for vim-go)

runtime! ftplugin/man.vim " Adds `:Man` command.
" }}}

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

" Search ------------------------------------------------------------------ {{{
set hlsearch      " Highlight results
set ignorecase    " Ignore casing of searches
set incsearch     " Start showing results as you type
set smartcase     " Be smart about case sensitivity when searching
set nostartofline " Don't go back to the start of the line.
set gdefault      " Substitution is global by default. g to toggle.
match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Match git conflict shit.
match Error 'byebug'
" }}}

" Tabs -------------------------------------------------------------------- {{{
set autoindent   " Copy indentation for new line.
set smartindent  " Autoindent.
set shiftwidth=2 " Number of spaces for indent.
set tabstop=2
set expandtab
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
nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l

" Remove search highligts.
nnoremap <silent> // :nohlsearch<CR>

" Close quickfix window.
nnoremap <leader>qq :cclose<CR>

" Switch to alternate file.
nnoremap <Leader><Leader> <C-^>

" Previous and next buffer.
nnoremap <silent> <Leader>z :bp<CR>
nnoremap <silent> <Leader>x :bn<CR>

" Don't go to next match.
nnoremap * *<c-o>

" cd into current file directory.
nnoremap <silent> <leader>d :cd %:p:h<cr>

" Split current line.
" TODO: Remove this. (splitjoin)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Equalize splits in current tab.
nnoremap <localleader>= :wincmd =<cr>

" Resize splits.
" if bufwinnr(1)
"   noremap + <C-W>+
"   noremap - <C-W>-
" endif

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Open help in vertical split.
cabbrev vhelp vert bo help

" Set paste remap.
nnoremap <leader>p :set paste!<CR>

" Tabs
nnoremap T :tabnew +Startify<cr>
nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>

" Search for visual block.
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

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

" Toggle tw and cc.
nnoremap <Leader>w :ToggleWidth<CR>

" Focus and Pulse current line.
nnoremap <c-e> mzzMzvzz15<c-e>`z:Pulse<cr>

" Duplicate current line.
nnoremap <c-d> Yp
nnoremap <c-D> YP

" Make the current line Breathe.
nnoremap <c-b> :Breathe<cr>

" Source visual / current line.
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}}

" autocmd ----------------------------------------------------------------- {{{

" Files ------------------------------------------------------------- {{{
augroup someshit
  autocmd!
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd FileType go setlocal ts=4 sw=4

  autocmd BufRead,BufNewFile *.js.erb set ft=javascript

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
  autocmd VimResized * :wincmd =
augroup END
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
nnoremap <Leader>t :CtrlP<cr>

" Uses the current working directory as root folder.
let g:ctrlp_cmd = 'CtrlPCurWD'

" Additional mapping for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap <leader>y :CtrlPCurWD<CR>

" Change the listing order of the files in the match window.
let g:ctrlp_match_window_reversed = 0

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 5000

" Don't jump to already open window.
let g:ctrlp_switch_buffer = 0

" Ignore these specific files and folders.
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v([\/]\.(git|hg|svn)|view|tmp|node_modules|venv|_site|vendor|bower_components)$',
      \ 'file': '\v\.(o|exe|netrwhist|pdf|png|jpg|gif)|tags$',
      \ }
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
      \ '~/.vimrc',
      \ '~/.vimrc.local',
      \ '~/.bashrc.local',
      \ '~/.gitconfig'
      \ ]

" When opening recent file, change to `%w(git svn hg).sample` root folder.
let g:startify_change_to_vcs_root = 1

let g:startify_files_number = 5

let g:ctrlp_reuse_window = 'startify'
" }}}

" Easy Align {{{

vmap <Enter> <Plug>(EasyAlign)
vnoremap <localleader><localleader> :EasyAlign=<CR>

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

" Visual search. Stolen from @sjl.
function! s:VSetSearch() " {{{
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction " }}}

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

" Rails.vim {{{
let g:rails_projections = {
      \ "spec/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/models/%i_test.rb",
      \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ },
      \ "app/serializers/*_serializer.rb": {
      \   "command":  "serializer",
      \   "affinity": "model",
      \   "test":     "spec/serializers/%s_spec.rb",
      \   "related":  "app/models/%s.rb",
      \   "template": "class %SSerializer < ActiveModel::Serializer\nend"
      \ },
      \ "app/uploaders/*_uploader.rb": {
      \   "command":  "uploader",
      \   "template": ["class %SUploader < CarrierWave::Uploader::Base", "end"],
      \   "test":     "spec/models/%s_uploader_spec.rb"
      \ }
      \}

let tmp = {
      \   "app/services/*.rb": {
      \     "command":  "service",
      \     "template": ["class %S", "end"],
      \     "test":     "spec/services/%s_spec.rb"
      \   }
      \ }

" open
nnoremap <leader>oc :CtrlP app/controllers/<CR>
nnoremap <leader>om :CtrlP app/models/<CR>
nnoremap <leader>os :CtrlP spec/<CR>
nnoremap <leader>ov :CtrlP app/views/<CR>
nnoremap <leader>of :CtrlP spec/factories/<CR>
nnoremap <leader>og :Elib<CR>

" edit
nnoremap <leader>ec :Econtroller<CR>
nnoremap <leader>em :Emodel<CR>
nnoremap <leader>es :A<CR>
nnoremap <leader>ev :Eview<CR>
nnoremap <leader>ef :Efactory<CR>
nnoremap <leader>eg :Elib<CR>

" split
nnoremap <leader>sc :Scontroller<CR>
nnoremap <leader>sm :Smodel<CR>
nnoremap <leader>ss :AS<CR>
nnoremap <leader>sv :Sview<CR>
nnoremap <leader>sf :Sfactory<CR>
nnoremap <leader>sg :Slib<CR>

" vsplit
nnoremap <leader>vc :Vcontroller<CR>
nnoremap <leader>vm :Vmodel<CR>
nnoremap <leader>vs :AV<CR>
nnoremap <leader>vv :Vview<CR>
nnoremap <leader>vf :Vfactory<CR>
nnoremap <leader>vg :Vlib<CR>
" }}}

" vim-test {{{
let g:test#strategy = 'dispatch'

nnoremap <leader>rt :TestNearest<CR>
nnoremap <leader>rT :TestFile<CR>
nnoremap <leader>rA :Dispatch rspec<CR>
nnoremap <leader>rl :TestLast<CR>

let g:test#ruby#rspec#executable = "CI=1 rspec"
" }}}

" vim-go {{{
let g:go_bin_path = expand("~/src/.go/bin")
let g:go_fmt_command = "goimports"
let g:go_doc_command = "godoc"
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
  set guifont=Inconsolata\ for\ Powerline:h13
endif
" }}}

" Herping and Derping {{{
iabbrev funciton function
iabbrev retunr return
iabbrev :hound: 🐕
iabbrev :dog: 🐕
" }}}

" Local shit ------------------------------------------------------------- {{{
" Source local file if it exists.
if filereadable(glob("~/.vimrc.local"))
  let $MYLOCALVIMRC="~/.vimrc.local"
  source $MYLOCALVIMRC
endif
" }}}
