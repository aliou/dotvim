local theme_callbacks = require('ad.theme.callbacks')
local hl = vim.highlight

local configure_theme = function(_)
  hl.create('InclineNormal', { guifg = '#b4b4b4', guibg = '#373737'})
  hl.create('InclineNormalNC', { guifg = '#b4b4b4', guibg = '#373737'})
end

theme_callbacks.on_theme_change('ad.ui.status', configure_theme)
