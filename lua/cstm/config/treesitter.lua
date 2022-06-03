require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "ruby",
    "rust",
    "scss",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml"
  },
  sync_install = false,

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
})
