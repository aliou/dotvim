require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  sync_install = false,

  highlight = {
    enable = { "go" },
  },
  endwise = {
    enable = true,
  },
})
