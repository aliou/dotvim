if has('viminfo')
  " '1000 => Number of previously edited files for which the marks are remembered.
  " <500  => Number of lines saved for each register.
  " :500  => Number of items in the command-line history to be saved.
  " /500  => Number of items in the search pattern history to be saved.
  set viminfo='1000,<500,:500,/500
  " Previous / default value:
  " set viminfo=!,'100,<50,s10,h

  " Don't keep .viminfo information for files in temp directories. This prevents
  " those files from appearing in `v:oldfiles` and `:oldfiles`.
  augroup cstm.viminfo
    autocmd!
    autocmd BufNewFile,BufReadPre /tmp/*,$TMPDIR/* setlocal viminfo=
  augroup END
endif
