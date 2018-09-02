" Don't bother about checking whether Escape is being used as a means to enter
" a Meta-key combination, just register Escape immediately
if exists('+esckeys')
  set noesckeys
endif

" Don't bother drawing the screen while executing macros or other automated or
" scripted processes, just draw the screen as it is when the operation
" completes
set lazyredraw

" Improve redrawing smoothness by assuming that my terminal is reasonably
" fast
set ttyfast

" Never use any kind of bell, visual or not
set visualbell t_vb=

" Require less than one second between keys for mappings to work correctly
set timeout
set timeoutlen=1000

" Require less than a twentieth of a second between keys for key codes to work
" correctly; I don't use Escape as a meta key anyway
set ttimeout
set ttimeoutlen=50

" This makes :Make work with Tmux 2.3+ (for dispatch and Ack)
set shellpipe+=\ 

" If the optional +reltime feature is compiled, significantly increase the
" default maximum time in milliseconds of syntax highlighting that leverages the
" regex-based :match builtin. The default value of 2000 fails to suffice for
" sufficiently large buffers for filetypes whose syntax highlighting plugins
" sufficiently complex calls to the :match builtin (e.g., Python scripts of more
" than ~1,500 lines). The value set here comes directly from Vim developers. For
" further details, see the following open issue:
"     https://github.com/vim/vim/issues/2790#issuecomment-400547834
if has('reltime')
  set redrawtime=10000
endif
