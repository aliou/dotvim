" vimrc
" Author: Aliou Diallo <code@aliou.me>

let mapleader = ","

" Stolen from @christoomey.
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

call s:SourceConfigFilesIn('rcplugins')

syntax on
filetype indent plugin on

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

  autocmd FileType go,godoc setlocal ts=4 sw=4

  autocmd BufRead,BufNewFile *.{js.erb,es6} set ft=javascript

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
