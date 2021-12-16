local ui_select = vim.ui.select

vim.ui.input = require('ad.ui.input')

vim.ui.select = function(items, opts, on_choice)
  ui_select(items, opts, on_choice)
end
