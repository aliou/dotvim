-- Start suggesting completion after two characters.
vim.g.completion_trigger_keyword_length = 2

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
