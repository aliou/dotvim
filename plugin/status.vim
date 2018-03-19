set statusline=%!status#active()

augroup statusline
  autocmd!

  " Use a simpler status line when the window is not in focus.
  autocmd WinEnter * setlocal statusline=%!status#active()
  autocmd WinLeave * setlocal statusline=%!status#inactive()

  " Update ALE indicators.
  autocmd User ALELintPre  call status#ale#pre('linter')  | redrawstatus
  autocmd User ALELintPost call status#ale#post('linter') | redrawstatus
  autocmd User ALEFixPre   call status#ale#pre('fixer')   | redrawstatus
  autocmd User ALEFixPost  call status#ale#post('fixer')  | redrawstatus
augroup END
