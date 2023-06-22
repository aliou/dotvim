require('ad.ui.color')

vim.ui.input = require('ad.ui.input')
vim.ui.select = require('ad.ui.select')

vim.notify = require('ad.ui.notify')

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.notifiy_with_level = function(level, fct)
  local previous_level = vim.log.level
  vim.log.level = level

  pcall(fct)

  vim.log.level = previous_level
end
