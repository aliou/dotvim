local watcher = require('ad.theme.watcher')
local callbacks = require('ad.theme.callbacks')
local util = require('github-theme.util')

-- Disable the auto switch while using github-theme.
vim.g.color_auto_switch = false

local default_options = {
  commentStyle = "NONE",
  keywordStyle = "NONE",
  functionStyle = "NONE",
  variableStyle = "NONE"
}

local configure_theme = function(scheme)
  local options = vim.tbl_extend('force', default_options, {
    themeStyle = scheme,
  })

  require('github-theme').setup(options)
  util.highlight('Todo', { fg = '#0a9dff', bg = 'fg_dark', style = 'bold' })
end
callbacks.on_theme_change(configure_theme)

-- Apply callbacks on colorscheme change.
if not vim.g.color_auto_switch then
  vim.cmd [[augroup ad.theme]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[  autocmd ColorScheme * :lua require('ad.theme.callbacks').execute_on_theme_change(vim.fn.expand('<amatch>'))]]
  vim.cmd [[augroup END]]
end

-- Set the theme for the first time.
configure_theme(watcher.read_file())

watcher.run()
