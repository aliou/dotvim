-- Custom highlight groups for diffs.
local apply_highlights = function()
  vim.highlight.create('GitSignsDiffAdd', { guifg = "#5F875F", ctermfg = 65 })
  vim.highlight.create('GitSignsDelete', { guifg = '#CC6666', ctermfg = 167 })
  vim.highlight.create('GitSignsChange', { guifg = '#5F5F87', ctermfg = 60 })
  vim.highlight.create('GitSignsChangeDelete', { guifg = '#5F5F87', ctermfg = 60 })
end

vim.cmd [[augroup ad.gitsigns]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd ColorScheme :lua require('ad.gitsigns').apply_highlights()]]
vim.cmd [[augroup END]]

apply_highlights()

require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsDiffAdd', text = '┃', numhl='GitSignsAddNr' },
    change       = { hl = 'GitSignsChange',  text = '┃', numhl='GitSignsChangeNr' },
    delete       = { hl = 'GitSignsDelete',  text = '┃', numhl='GitSignsDeleteNr' },
    topdelete    = { hl = 'GitSignsDelete',  text = '┃', numhl='GitSignsDeleteNr' },
    changedelete = { hl = 'GitSignsChange',  text = '┃', numhl='GitSignsChangeNr' },
  },
  numhl = true,
  keymaps = {
    -- Default keymap options
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
  sign_priority = 6,
  status_formatter = nil, -- Use default
})

return {
  apply_highlights = apply_highlights
}
