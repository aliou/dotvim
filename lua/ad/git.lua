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
  watch_index = { interval = 5000 },
  status_formatter = nil, -- Use default

  current_line_blame = true,
  current_line_blame_opts = { delay = 500 },
  current_line_blame_formatter = blame_formatter,
})

vim.cmd [[
  command! Gcommit vertical Git commit
  command! Gblame vertical Git blame
]]
