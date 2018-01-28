set statusline=%!status#active()

augroup statusline
  autocmd!

  autocmd WinEnter * setlocal statusline=%!status#active()
  autocmd WinLeave * setlocal statusline=%!status#inactive()
augroup END
