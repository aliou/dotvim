" TODO: Define custom highlight groups for the status bar sections.

highlight StatusPrimary term=reverse cterm=reverse ctermfg=250 ctermbg=237 guifg=#c5c8c6 guibg=#373b41
highlight StatusSecondary ctermbg=235 guibg=#282a2e

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
