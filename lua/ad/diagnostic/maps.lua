local toggle = function()
  if vim.b.diagnostic_displayed then
    vim.diagnostic.hide(nil, 0)
  else
    vim.diagnostic.show(nil, 0)
  end

  vim.b.diagnostic_displayed = not vim.b.diagnostic_displayed
end

local next = function()
  vim.diagnostic.goto_next({ wrap = true })
end

local prev = function()
  vim.diagnostic.goto_prev({ wrap = true })
end

-- Navigate around errors or warnings.
vim.keymap.set('n', '[a', prev, { desc = "[diagnostic] go to prev" })
vim.keymap.set('n', ']a', next, { desc = "[diagnostic] go to next" })
vim.keymap.set('n', '<leader>at', toggle, { desc = "[diagnostic] toggle display of diagnostic" })
