-- Start suggesting completion after two characters.
vim.g.completion_trigger_keyword_length = 2

-- Trigger when deleting stuff.
vim.g.completion_trigger_on_delete = 1

-- Configure completion chaining.
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = {'lsp', 'tags'} },
    { complete_items = {'path'}, triggered_only = {'/'} },
    { mode = '<c-p>' },
    { mode = '<c-n>' },
  },
  comment = {}
}
