-- menuone: Display popup menu for a single entry, so we can see the floating
-- window.
-- noinsert: Don't insert text until a match is selected to handle async
-- filling of the menu.
vim.o.completeopt="menuone,noinsert"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

-- Trigger when deleting stuff.
vim.g.completion_trigger_on_delete = true

-- Automatically change completion source when there's no completion item.
vim.g.completion_auto_change_source = true

-- Configure completion chaining.
vim.g.completion_chain_complete_list = {
  default = {
    default = {
      { complete_items = {'lsp'} },
      { complete_items = {'tags'} },
      { complete_items = {'path'}, triggered_only = {'/'} },
      { mode = '<c-p>' },
      { mode = '<c-n>' },
    },
    comment = {}
  }
}

vim.api.nvim_exec([[
  augroup cstm.completion
    autocmd!

    autocmd BufEnter * lua require('cstm.completion').on_attach()
  augroup END
]], true)
