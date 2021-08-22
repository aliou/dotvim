local telescope = require('telescope')

local options = {
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
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}

telescope.setup(options)
telescope.load_extension('fzf')

vim.api.nvim_exec([[
  nnoremap <silent> <leader>t <cmd>Telescope find_files<cr>
  nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>
  nnoremap <silent> <leader>m <cmd>Telescope oldfiles<cr>
  nnoremap <silent> <leader>s <cmd>Telescope grep_string<cr>
]], true)
