require('ad.git.signs')

vim.cmd [[
  command! Gcommit vertical Git commit
  command! Ghunks copen | Gitsigns setqflist('all')
]]
