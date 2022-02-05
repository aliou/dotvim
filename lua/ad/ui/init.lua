vim.ui.input = require('ad.ui.input')
vim.ui.select = require('ad.ui.select')

local prev_notify = vim.notify

-- TODO: Ignore some messages, e.g. the "no code action available"
vim.notify = function(message, level, options)
  prev_notify(message, level, options)
end
