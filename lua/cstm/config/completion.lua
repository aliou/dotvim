local compe = require('compe')
local map = require('cstm.util').map

-- menuone: Display popup menu for a single entry, so we can see the floating
-- window.
-- noinsert: Don't insert text until a match is selected to handle async
-- filling of the menu.
vim.o.completeopt="menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

compe.setup({
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
  }
})

-- Confirm snippet insertion.
map('i', '<CR>', [[compe#confirm('<CR>')]], { silent = true, expr = true })
