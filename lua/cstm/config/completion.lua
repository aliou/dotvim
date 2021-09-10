local cmp = require('cmp')

-- menuone: Display popup menu for a single entry, so we can see the floating
-- window.
-- noinsert: Don't insert text until a match is selected to handle async
-- filling of the menu.
vim.o.completeopt="menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm()
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end,
  },
})
