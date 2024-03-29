local telescope = require('telescope')

local telescope_options = {
  defaults = {
    layout_config = {
      prompt_position = 'top',
      height = 0.8,
      width = 0.9,
    },
    sorting_strategy = 'ascending',
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<esc>"] = 'close',
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    live_grep_args = {
      auto_quoting = true
    }
  }
}

telescope.setup(telescope_options)
telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
