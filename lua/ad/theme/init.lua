local watcher = require('ad.theme.watcher')

-- Apply callbacks on colorscheme change.
vim.cmd [[augroup ad.theme]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd ColorScheme * :lua require('ad.theme.callbacks').execute_on_theme_change(vim.fn.expand('<amatch>'))]]
vim.cmd [[augroup END]]

watcher.run()
