local theme_callbacks = require('ad.theme.callbacks')

-- Customize Diagnostic highlights.
local configure_theme = function(_)
  vim.highlight.create('DiagnosticError', { cterm = 'bold', ctermfg = 167, gui = 'bold', guifg = '#CC6666' })
  vim.highlight.create('DiagnosticWarn', { ctermfg = 173, gui = 'bold', guifg = '#de935f' })
  vim.highlight.create('DiagnosticInfo', { cterm = 'bold', ctermfg = 60, gui = 'bold', guifg = '#5F5F87' })
  vim.highlight.create('DiagnosticHint', { cterm = 'bold', ctermfg = 173, gui = 'bold', guifg = '#c7915b' })
  vim.highlight.create('DiagnosticSuccess', { guifg = "#5F875F", ctermfg = 65 })
end

-- Re-apply highlights on theme changes.
theme_callbacks.on_theme_change('ad.diagnostic', configure_theme)
