local theme_callbacks = require('ad.theme.callbacks')

-- Customize Diagnostic highlights.
local configure_theme = function(_)
  vim.api.nvim_set_hl(0, 'DiagnosticError', { bold = true, fg = '#CC6666', ctermfg = 167 })
  vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bold = true, fg = '#de935f', ctermfg = 173 })
  vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bold = true, fg = '#5F5F87', ctermfg = 60 })
  vim.api.nvim_set_hl(0, 'DiagnosticHint', { bold = true, fg = '#c7915b', ctermfg = 173 })
  vim.api.nvim_set_hl(0, 'DiagnosticSuccess', { bold = true, fg = "#5F875F", ctermfg = 65 })
end

-- Re-apply highlights on theme changes.
theme_callbacks.on_theme_change('ad.diagnostic', configure_theme)
