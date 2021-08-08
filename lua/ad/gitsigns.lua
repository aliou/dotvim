require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsDiffAdd', text = '┃' },
    change       = { hl = 'GitSignsChange',  text = '┃' },
    delete       = { hl = 'GitSignsDelete',  text = '┃' },
    topdelete    = { hl = 'GitSignsDelete',  text = '┃' },
    changedelete = { hl = 'GitSignsChange',  text = '┃' },
  },
  current_line_blame = true,
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
  watch_index = {
    interval = 1000
  },
  status_formatter = nil, -- Use default
})
