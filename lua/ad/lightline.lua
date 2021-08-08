local on_theme_change = require('ad.theme.callbacks').on_theme_change

-- TODO: Change this with custom cool themes :)
DEFAULT_CONFIG = { dark = 'default', light = 'one' }

on_theme_change(function(theme)
  local lightline_theme = DEFAULT_CONFIG[theme]
  vim.g.lightline.colorscheme = lightline_theme
  vim.fn['lightline#update']()
end)
