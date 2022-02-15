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

require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsDiffAdd', text = '┃' },
    change       = { hl = 'GitSignsChange',  text = '┃' },
    delete       = { hl = 'GitSignsDelete',  text = '┃' },
    topdelete    = { hl = 'GitSignsDelete',  text = '┃' },
    changedelete = { hl = 'GitSignsChange',  text = '┃' },
  },
  keymaps = {
    -- Default keymap options
    -- TODO: Use neovim's API functions instead of gitsigns options?
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk({ wrap = false })<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk({ wrap = false })<CR>'"},

    ['n <leader>ha'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hd'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
  },
  watch_gitdir = { interval = 5000 },
  status_formatter = nil, -- Use default

  current_line_blame = true,
  current_line_blame_opts = { delay = 500 },
  current_line_blame_formatter = blame_formatter,
})

-- Customize GitSigns highlights.
local configure_theme = function(_)
  vim.highlight.create('GitSignsDiffAdd', { guifg = "#5F875F", ctermfg = 65 })
  vim.highlight.create('GitSignsDelete', { guifg = '#CC6666', ctermfg = 167 })
  vim.highlight.create('GitSignsChange', { guifg = '#5F5F87', ctermfg = 60 })
  vim.highlight.create('GitSignsChangeDelete', { guifg = '#5F5F87', ctermfg = 60 })
  vim.highlight.create('GitSignsCurrentLineBlame', { guifg = '#5F5F87' })
end

-- Re-apply highlights on theme changes.
theme_callbacks.on_theme_change('ad.git', configure_theme)

vim.cmd [[
  command! Gblame vertical Git blame
]]
