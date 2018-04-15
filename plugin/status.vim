" TODO: Define custom highlight groups for the status bar sections.


set statusline=%!status#active()

augroup plugin_statusline
  autocmd!

  " Use a simpler status line when the window is not in focus.
  autocmd WinEnter * setlocal statusline=%!status#active()
  autocmd WinLeave * setlocal statusline=%!status#inactive()

  " Update ALE indicators.
  autocmd User ALELintPre  call status#ale#pre_lint()  | redrawstatus
  autocmd User ALELintPost call status#ale#post_lint() | redrawstatus

  autocmd User ALEFixPre   call status#ale#pre_fix()   | redrawstatus
  autocmd User ALEFixPost  call status#ale#post_fix()  | redrawstatus
augroup END
