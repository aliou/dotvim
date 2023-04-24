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
    "prisma",
    "query",
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
    enable = false,
  },
  endwise = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
})
