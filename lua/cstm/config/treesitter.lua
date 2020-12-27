require('nvim-treesitter.configs').setup({
  ensure_installed = { "ruby", "rust", "lua" },
  -- TODO: Add custom highlights for rspec focus and skipped things.
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "lua" }
  },
})

-- Fix issue with nvim-treesitter and Ruby where `%` and highlighting pairs
-- don't correctly work.
vim.api.nvim_exec([[
  augroup nvim.treesitter
    autocmd!

    autocmd BufNewFile,BufRead *.rb set syntax=ruby
  augroup END
]], true)
