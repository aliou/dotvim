local gs = require('gitsigns')

local theme_callbacks = require('ad.theme.callbacks')

local blame_formatter = function(name, blame_info, _)
  if blame_info.author == 'Not Committed Yet' then
    return {{ '-- ' .. blame_info.author, 'GitSignsCurrentLineBlame' }}
  end

  local date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
  local text = string.format('%s - %s', date_time, blame_info.summary)

  if blame_info.author ~= name then
    text = text .. ' (' .. blame_info.author .. ')'
  end
  return {{ '-- '..text, 'GitSignsCurrentLineBlame' }}
end

-- Navigate around hunks
local next = function()
  gs.next_hunk({ wrap = false })
end

local prev = function()
  gs.prev_hunk({ wrap = false })
end

require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsDiffAdd', text = '┃' },
    change       = { hl = 'GitSignsChange',  text = '┃' },
    delete       = { hl = 'GitSignsDelete',  text = '┃' },
    topdelete    = { hl = 'GitSignsDelete',  text = '┃' },
    changedelete = { hl = 'GitSignsChange',  text = '┃' },
  },
  on_attach = function(_)
    if not vim.o.diff then
      vim.keymap.set('n', ']c', next, { buffer = true, desc = '[git] go to next hunk' })
      vim.keymap.set('n', '[c', prev, { buffer = true, desc = '[git] go to prev hunk' })
    end

    vim.keymap.set('n', '<leader>ha', gs.stage_hunk, { buffer = true, desc = '[git] stage hunk' })
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = true, desc = '[git] undo stage hunk' })
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = true, desc = '[git] preview hunk' })
    vim.keymap.set('n', '<leader>hd', gs.reset_hunk, { buffer = true, desc = '[git] reset hunk' })
  end,
  watch_gitdir = { interval = 5000 },
  status_formatter = nil, -- Use default

  current_line_blame = true,
  current_line_blame_opts = { delay = 500 },
  current_line_blame_formatter = blame_formatter,
})

-- Customize GitSigns highlights.
local configure_theme = function(_)
  vim.api.nvim_set_hl(0, 'GitSignsDiffAdd', { fg = "#5F875F", ctermfg = 65 })
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#CC6666', ctermfg = 167 })
  vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#5F5F87', ctermfg = 60 })
  vim.api.nvim_set_hl(0, 'GitSignsChangeDelete', { fg = '#5F5F87', ctermfg = 60 })
  vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#5F5F87' })
end

-- Re-apply highlights on theme changes.
theme_callbacks.on_theme_change('ad.git', configure_theme)

-- Re-enable deprecated commands from vim-fugitive.
vim.api.nvim_create_user_command('Gblame', 'vertical Git blame', { desc = '[git] run blame in a vertical split', force = true })
vim.api.nvim_create_user_command('Gcommit', 'Git commit', { desc = '[git] commit staged changes', force = true })
vim.api.nvim_create_user_command('Gbrowse', 'GBrowse', { desc = '[git] browse commit on GitHub', force = true })
