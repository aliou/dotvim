" Keep command and search history.
set history=1000

" Always report the number of lines changed by a command.
set report=0

if has('cmdline_info')
  " Don't show the current command.
  set noshowcmd

  " Show the mode we are in.
  set showmode
endif

" Readline stuff.
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
