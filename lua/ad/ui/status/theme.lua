local theme_callbacks = require('ad.theme.callbacks')

local configure_theme = function(_)
  vim.api.nvim_set_hl(0, 'InclineNormal', { fg = '#b4b4b4', bg = '#373737'})
  vim.api.nvim_set_hl(0, 'InclineNormalNC', { fg = '#b4b4b4', bg = '#373737'})
end

theme_callbacks.on_theme_change('ad.ui.status', configure_theme)
