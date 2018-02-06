set statusline=%!status#active()

augroup statusline
  autocmd!

  " Use a simpler status line when the window is not in focus.
  autocmd WinEnter * setlocal statusline=%!status#active()
  autocmd WinLeave * setlocal statusline=%!status#inactive()

  " Update ale indicator in status line.
  autocmd User ALELintPre  call status#ale_pre()
  autocmd User ALELintPost call status#ale_post()
augroup END
