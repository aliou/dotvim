local glance = require('glance')
local actions = glance.actions

glance.setup({
  detached = false,
  border = {
    enable = true,
    top_char = '―',
    bottom_char = '―',
  },
  list = {
    position = 'left',
    width = 0.40,
  },
  theme = {
    enable = true,
    mode = 'brighten',
  },
  mappings = {
    list = {
      ['j'] = actions.next_location,
      ['k'] = actions.previous_location,

      ['<Tab>'] = actions.next,
      ['<S-Tab>'] = actions.previous,

      ['v'] = actions.jump_vsplit,
      ['s'] = actions.jump_split,
      ['t'] = actions.jump_tab,

      ['<CR>'] = actions.jump,
      ['o'] = false,

      ["<C-q>"] = actions.quickfix,

      ['q'] = actions.close,
      ['<Esc>'] = actions.close,
    },
    preview = {
      ['q'] = actions.close,
      ['Q'] = actions.close,
      ['<Esc>'] = actions.close,

      ['<Tab>'] = actions.next_location,
      ['<S-Tab>'] = actions.previous_location,
      ['<leader>l'] = actions.enter_win('list'), -- Focus list window
    },
  },
  hooks = {
    before_open = function(results, open, jump, _method)
      if #results == 1 then
        jump(results[1]) -- argument is optional
      else
        open(results) -- argument is optional
      end
    end,
  }
})

vim.api.nvim_set_hl(0, 'GlancePreviewMatch', { link = "CurSearch" })
vim.api.nvim_set_hl(0, 'GlanceListMatch', { link = "CurSearch" })

-- TODO: update higlights for search.
-- vim.api.nvim_set_hl(0, 'GlancePreviewMatch', { bg="#xxxxxx", ctermbg=xxx })