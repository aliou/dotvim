local watcher = require('ad.theme.watcher')
local callbacks = require('ad.theme.callbacks')
local util = require('github-theme.util')

-- Disable the auto switch while using github-theme.
vim.g.color_auto_switch = false

local default_options = {
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE"
}

local configure_theme = function(scheme)
  local options = vim.tbl_extend('force', default_options, {
    theme_style = scheme,
  })

  require('github-theme').setup(options)
  -- TODO: Improve handling of custom highlights.
  util.highlight('Todo', { fg = '#0a9dff', bg = 'fg_dark', style = 'bold' })

  vim.highlight.create('GitSignsDiffAdd', { guifg = "#5F875F", ctermfg = 65 })
  vim.highlight.create('GitSignsDelete', { guifg = '#CC6666', ctermfg = 167 })
  vim.highlight.create('GitSignsChange', { guifg = '#5F5F87', ctermfg = 60 })
  vim.highlight.create('GitSignsChangeDelete', { guifg = '#5F5F87', ctermfg = 60 })
  vim.highlight.create('GitSignsCurrentLineBlame', { guifg = '#5F5F87' })

  vim.highlight.create('DiagnosticsError', { cterm = 'bold', ctermfg = 167, gui = 'bold', guifg = '#CC6666' })
  vim.highlight.create('DiagnosticsWarning', { ctermfg = 173, gui = 'bold', guifg = '#de935f' })
  vim.highlight.create('DiagnosticsInformation', { cterm = 'bold', ctermfg = 60, gui = 'bold', guifg = '#5F5F87' })
  vim.highlight.create('DiagnosticsHint', { cterm = 'bold', ctermfg = 173, gui = 'bold', guifg = '#c7915b' })
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
