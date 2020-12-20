require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "rust", "lua" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "lua" }
  },
}
